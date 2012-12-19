function cutStringByLength(str, maxLength){
	if (str.length > maxLength){
		str = str.substring(0, maxLength - 1) + "…";
	}
	return str;
}