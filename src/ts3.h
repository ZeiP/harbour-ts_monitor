#ifndef TS3_H
#define TS3_H

#include <QObject>
#include <QStringListModel>

class TS3 : public QObject
{
  Q_OBJECT

public:
  //Q_PROPERTY(QStringListModel users READ users NOTIFY usersChanged)

  explicit TS3(QObject *parent = 0);

  Q_INVOKABLE QStringList fetchUsers(QString hostname, QString port, QString server_id);

  Q_INVOKABLE QString userCount(QString hostname, QString port, QString server_id);
    /*
  Q_INVOKABLE bool write(const QString& data);
  Q_INVOKABLE bool exists();
  Q_INVOKABLE bool exists(const QString& filename);
  Q_INVOKABLE bool mkpath(const QString& dirpath);
  */

  QStringListModel users();

public slots:

signals:
  void usersChanged(const QString& users);
  void error(const QString& msg);

private:

};

#endif // TS3_H
