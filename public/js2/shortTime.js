function shortTime(d){
	var h = d.getHours();
	var m = d.getMinutes();
	if(h<10){h="0"+h;}
	if(m<10){m="0"+m;}
	return h + ":" + m + " ." +d.getSeconds();
}
