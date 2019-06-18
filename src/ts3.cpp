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

  if (port == "") {
      port = "10011";
  }
  if (server_id == "") {
      server_id = "0";
  }

  QTcpSocket socket;

  socket.connectToHost(hostname, (quint32) port.toInt());
  if (!socket.waitForConnected(5000)) {
        return users;
  }

  QByteArray res;
  bool initiated = false;
  while (socket.waitForReadyRead(5000)) {
      res = socket.readAll();
      if (res.contains("Welcome to the TeamSpeak 3 ServerQuery interface")) {
          initiated = true;
          break;
      }
  }
  if (!initiated) {
      return users;
  }

  socket.write(("use " + server_id + "\n").toUtf8());
  socket.waitForBytesWritten(5000);
  socket.write("clientlist\n");
  socket.waitForBytesWritten(5000);

  while (socket.waitForReadyRead(5000)) {
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
