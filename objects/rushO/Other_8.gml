rushexit = path_add()
	if instance_exists(doorexit) {path_add_point(rushexit,rushO.x,rushO.y,100) path_add_point(rushexit,doorexit.x,doorexit.y,100) path_start(rushexit,4,path_action_stop,true)}
	if instance_exists(doorexitb) {path_add_point(rushexit,rushO.x,rushO.y,100) path_add_point(rushexit,doorexitb.x,doorexitb.y,100) path_start(rushexit,4,path_action_stop,true)}
	if instance_exists(doorexitr) {path_add_point(rushexit,rushO.x,rushO.y,100) path_add_point(rushexit,doorexitr.x,doorexitr.y,100) path_start(rushexit,4,path_action_stop,true)}
	if instance_exists(doorexity) {path_add_point(rushexit,rushO.x,rushO.y,100) path_add_point(rushexit,doorexity.x,doorexity.y,100) path_start(rushexit,4,path_action_stop,true)}
	if instance_exists(sidexitL) {path_add_point(rushexit,rushO.x,rushO.y,100) path_add_point(rushexit,sidexitL.x + 10,sidexitL.y,100) path_start(rushexit,4,path_action_stop,true)}
	if instance_exists(sidexitR) {path_add_point(rushexit,rushO.x,rushO.y,100) path_add_point(rushexit,sidexitR.x,sidexitR.y,100) path_start(rushexit,4,path_action_stop,true)}


