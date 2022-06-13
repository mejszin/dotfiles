task :startup do
    system('screen -AdmS myshell -t tab0 bash')
    system('screen -S myshell -X screen -t "haedi API" sudo -u louis ./scripts/start-haedi-api.sh')
    system('screen -S myshell -X screen -t "milkbox API" sudo -u louis ./scripts/start-milkbox-api.sh')
    system('screen -S myshell -X screen -t "milkbox bot" ./scripts/start-milkbox-bot.sh')
    system('screen -S myshell -X screen -t "productivity bot" ./scripts/start-productivity-bot.sh')
    system('screen -S myshell -X screen -t "spotify bot" ./scripts/start-spotify-bot.sh')
end

task :anim do
    system('python3 ./scripts/rainfall.py')
end
