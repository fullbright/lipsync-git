offlinegit = {
    delay = 5,

    maxProcesses = 1,

    ---onCreate = "cp -r ^sourcePathname ^targetPathname",
    onCreate = "/opt/lipsync-git/bin/add-file ^sourcePathname ^source",

    ---onModify = "cp -r ^sourcePathname ^targetPathname",
    onModify = "/opt/lipsync-git/bin/modify-file ^sourcePathname ^source",

    ---onDelete = "/opt/lipsync-git/bin/del-file ^targetPathname ^source",
    onDelete = "/opt/lipsync-git/bin/del-file ^sourcePath ^source",

    onMove   = "/opt/lipsync-git/bin/move-file ^o.sourcePathname ^d.sourcePathname ^source",

    ---onStartup = [[if [ "$(ls -A ^source)" ]; then cp -r ^source* ^target; fi]],
    onStartup = "/opt/lipsync-git/bin/start-sync ^source",
}

sync{
	offlinegit, 
	source="/home/fullbright/my-lipsync-git/", 
	host="sergio@home.afanou.com", 
	targetdir="/home/sergio/mydropbox/",
	excludeFrom="/opt/lipsync-git/etc/exclude_rules.conf",
	rsyncOpts="-ltus"
}
