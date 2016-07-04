/*
 * Copyright (c) 2014, Stefan Brand <seiichiro@seiichiro0185.org>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice, this
 *    list of conditions and the following disclaimer in the documentation and/or other
 *    materials provided with the distribution.
 *
 * 3. The names of the contributors may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "ts3.h"
#include <QTcpSocket>
#include <QNetworkAccessManager>
#include <QDebug>
#include <QRegularExpression>
#include <QStringListModel>
#include <QQmlContext>
#include <QQuickView>

TS3::TS3(QObject *parent) :
  QObject(parent)
{

}

QStringList TS3::fetchUsers(QString hostname, QString port, QString server_id)
{
  QStringList users = QStringList();

  QTcpSocket socket;

  socket.connectToHost(hostname, (quint32) port.toInt());
  if (!socket.waitForConnected(5000)) {
      return users;
  }
  socket.waitForReadyRead();

  while (true) {
      if (socket.canReadLine()) {
          socket.readAll();
          socket.waitForReadyRead();
          break;
      }
  }

  socket.write(("use " + server_id + "\n").toUtf8());
  socket.waitForBytesWritten();
  socket.write("clientlist\n");
  socket.waitForBytesWritten();

  socket.waitForReadyRead();
  while (true) {
    QByteArray ba = socket.readLine();
    QString s_data = QString::fromUtf8(ba.data());

    if (s_data.contains("client_nickname")) {
        QRegularExpression regex("client_nickname=([^ ]*)");
        QRegularExpressionMatchIterator i = regex.globalMatch(s_data);
        while (i.hasNext()) {
            QRegularExpressionMatch match = i.next();
            users << match.captured(1).replace("\\s", " ");
        }
        break;
    }
  }

  socket.close();

  return users;

  /*
  QNetworkAccessManager *manager = new QNetworkAccessManager(this);
  manager->connectToHost('linode.leivo.org', port);

  QByteArray req = "use 1";
  QNetworkReply* reply = manager->put(null, req);
*/
}

QString TS3::userCount(QString hostname, QString port, QString server_id)
{
    QStringList users = this->fetchUsers(hostname, port, server_id);
    int userCount = users.count();
    return QString::number(userCount);
}
