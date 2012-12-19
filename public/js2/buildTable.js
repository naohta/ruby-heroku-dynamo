function buildTable(tbl, rows){
	tbl.empty();
	for(var i=0; i<rows.length; i++){
		tbl.append("<tr>" + td_head(i) + td(dig("",rows[i])) + "</tr>");
	}
};

/* ------------------------------------ */
function td(data){
	return "<td>" + data + "</td>";
}

function td_head(i){
	return td("[" + (i+1) + "]");
}

function spanForKey(k){
	return "<span class='key'>" +k+ "<br/></span>";
}

function spanForValue(i){
	return "<span class='value'>" +i+ "</span>";
}

function dig(s/*string*/,o/*object*/,parentkey){
	for(var key in o){
		if(key=='resultInJSON'){console.log("resultInJSON !!");continue;}
		var value = o[key];
		var valueType = typeof(value);
		if(valueType == 'object'){
			var k;
			if(parentkey==null){
				k = key;
			}else{
				k = parentkey + "." + key;
			}
			s = dig(s,value,k); /*Recursive call*/
		}else{
			var keyForDisp;
			if(parentkey==null){
				keyForDisp = key;
			}else{
				keyForDisp = parentkey + "." + key;
			}
			s += td( spanForKey(keyForDisp) + spanForValue(value) );
		}
	}
	return s;
}