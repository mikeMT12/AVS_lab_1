#!/bin/bash
apt-get update && apt-get install -y less
mkdir ~/lab0
cd ~/lab0
git init
mkdir -p ~/lab0/eleon/reception
mkdir -p ~/lab0/eleon/staff_room
mkdir -p ~/lab0/eleon/roof
mkdir -p ~/lab0/eleon/hotel_office
mkdir -p ~/lab0/eleon/victor/kitchen
touch ~/lab0/eleon/victor/kitchen/dinner_order
mkdir  ~/lab0/eleon/victor/hall
touch ~/lab0/eleon/victor/hall/opening_guests
touch ~/lab0/eleon/hotel_office/eleonora_order
touch ~/lab0/eleon/reception/sofia_schedule
touch ~/lab0/eleon/reception/guest_notes
touch ~/lab0/eleon/staff_room/barinov_uniform
touch ~/lab0/eleon/staff_room/kostya_message
touch ~/lab0/eleon/roof/max_letter
touch ~/lab0/eleon/roof/roof_event
echo "Блюдо от Виктора Баринова
Закуска от Екатерины Семёновой
Десерт для гостей отеля Eleon
Новое блюдо Дениса на проверке у шефа" > ~/lab0/eleon/victor/kitchen/new_menu
echo "На кухне подготовить утиную ножку
В зал отправить две рыбные закуски
Для Софии приготовить особый десерт" > ~/lab0/eleon/victor/kitchen/dinner_order
echo "Элеонора Андреевна встречает первых гостей
София Яновна проверяет готовность зала
Виктор Баринов представляет новое меню
Костя помогает команде ресторана" > ~/lab0/eleon/victor/hall/opening_guests
echo "Ресторан Victor должен открыться вовремя
Баринов отвечает за кухню
София встречает важных гостей
Персонал отеля помогает в зале" > ~/lab0/eleon/hotel_office/eleonora_order
echo "Утром проверить ресторан Victor
Днём провести встречу с Элеонорой
Вечером принять первых гостей" > ~/lab0/eleon/reception/sofia_schedule
echo "Гости попросили столик рядом с окном
Один гость хочет поговорить с Бариновым
Постоянные гости ждут знакомое блюдо" > ~/lab0/eleon/reception/guest_notes
echo "Новый китель приготовлен для шефа
На форме вышито имя Виктор
Китель находится в комнате персонала" > ~/lab0/eleon/staff_room/barinov_uniform
echo "Костя приехал помочь перед открытием
Бар готов к вечернему обслуживанию
После смены он ждёт Настю в холле" > ~/lab0/eleon/staff_room/kostya_message
echo "Макс передал привет всей команде
Он помнит работу с Виктором Петровичем
Письмо оставлено на крыше отеля" > ~/lab0/eleon/roof/max_letter
echo "Баринов поднялся на крышу после смены
Элеонора нашла его возле старого рояля
Команда ресторана собралась вместе" > ~/lab0/eleon/roof/roof_event
echo "Ресторан Victor открывается вечером
Баринов проверяет работу кухни
София встречает гостей в зале" > ~/lab0/opening_day
chmod 755 ~/lab0/eleon
chmod u=rwx,g=r-x,o=--- ~/lab0/eleon/victor
chmod 750 ~/lab0/eleon/victor/kitchen
chmod u=rw-,g=r--,o=r-- ~/lab0/eleon/victor/kitchen/new_menu
chmod 640 ~/lab0/eleon/victor/kitchen/dinner_order
chmod u=rwx,g=rwx,o=--- ~/lab0/eleon/victor/hall
chmod 644  ~/lab0/eleon/victor/hall/opening_guests
chmod 710 ~/lab0/eleon/hotel_office
chmod u=r--,g=r--,o=--- ~/lab0/eleon/hotel_office/eleonora_order
chmod u=rwx,g=r-x,o=--x ~/lab0/eleon/reception
chmod 650 ~/lab0/eleon/reception/sofia_schedule
chmod u=rw-,g=r--,o=--- ~/lab0/eleon/reception/guest_notes
chmod 750 ~/lab0/eleon/staff_room
chmod 600 ~/lab0/eleon/staff_room/barinov_uniform
chmod u=r--,g=r--,o=--- ~/lab0/eleon/staff_room/kostya_message
chmod u=rwx,g=r-x,o=--- ~/lab0/eleon/roof
chmod 640 ~/lab0/eleon/roof/max_letter
chmod u=r--,g=r---,o=--- ~/lab0/eleon/roof/roof_event
chmod 644 ~/lab0/opening_da
cd ~/lab0
git status
git branch -m main
git add .
git status
git commit -m "Решение части 1"
git remote add origin https://github.com/mikeMT12/AVS_lab_1.git
git push --set-upstream origin main
cp ~/lab0/eleon/hotel_office/eleonora_order ~/lab0/eleon/victor/hall/owner_order
cp -r eleon/roof eleon/victor/roof_archive
cd ~/lab0/eleon/staff_room
ln -s ../victor/kitchen/new_menu current_menu
cd ~/lab0
ln -s eleon/reception hotel_reception
ln ~/lab0/opening_day ~/lab0/eleon/victor/hall/opening_log
cat eleon/victor/hall/opening_guests eleon/reception/guest_notes > eleon/reception/all_guests
cat eleon/staff_room/kostya_message >> opening_day
mv eleon/roof/max_letter eleon/hotel_office/max_message
git status
git add .
git commit -m "Решение части 2"
git push
cd ~/lab0
ls -lR eleon | grep "^-" | sort -nr -k 5| head -n 6 
grep -irhe "баринов" -e "софия" ~/lab0/eleon | grep -vi "гост" | sort | head -n 5 
grep -rli "гост" ~/lab0/eleon/victor/hall ~/lab0/eleon/reception | wc -l
( head -qn 1 ~/lab0/eleon/reception/*; tail -qn 1 ~/lab0/eleon/reception/*) | grep -ie "гост" -e "соф" | sort -r
grep -hv "столик" ~/lab0/eleon/reception/all_guests | sort -r | head -n 4 | wc -w
ls -Rl ~/lab0 | grep -E  "^-[^ ]+ +2 "| sort -k 9 
grep -rli -e "баринов" -e "макс" ~/lab0/eleon/victor/roof_archive | wc -l
rm -f eleon/hotel_office/eleonora_order
rm -f eleon/staff_room/current_menu
rm -f hotel_reception
rm -f ~/lab0/opening_day
rm -f eleon/victor/hall/opening_log
rm -f eleon/roof/roof_event
rmdir eleon/roof
rm -r eleon/victor/roof_archive
git add .
git commit -m "Решение 3 части"
git push