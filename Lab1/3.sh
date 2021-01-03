echo -e  "Выберите пункт меню\n1 - nano\n2 - vi\n3 - browser\n4 - exit"


while read line
do
case $line in
    "1")
    nano
    ;;
    "2")
    vi
    ;;
    "3")
    firefox
    ;;
    "4")
    break
    ;;
    *)
          echo "Нет такой команды"
          ;;
esac
done
