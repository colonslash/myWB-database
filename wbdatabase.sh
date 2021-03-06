function wbdatabase() {
  case $1 in
  start)
    if test -f "wbdatabase_pid.txt"
    then
      echo "WB Database is already running"
    else
      echo "Starting WB Database"
        nohup java -jar database.jar > wbdatabase.log 2>&1 &
        echo $! > wbdatabase_pid.txt
        echo "WB Database is now online!"
    fi
  ;;
  stop)
    if test -f "wbdatabase_pid.txt"
    then
      echo "Stopping WB Database"
      kill -9 `cat wbdatabase_pid.txt`
      rm wbdatabase_pid.txt
    else
      echo "WB Database is not already running"
    fi
  ;;
  restart)
    if test -f "wbdatabase_pid.txt"
    then
      echo "Stopping WB Database"
      kill -9 `cat wbdatabase_pid.txt`
      rm wbdatabase_pid.txt
      echo "Starting WB Database"
      nohup java -jar database.jar > wbdatabase.log 2>&1 &
      echo $! > wbdatabase_pid.txt
      echo "WB Database is now online!"
    else
      echo "WB Database is not already running"
    fi
  ;;
  status)
    if test -f "wbdatabase_pid.txt"
    then
      echo "WB Database is online!"
    else
      echo "WB Database is offline!"
    fi
  ;;
esac
}