/**
 * NAVerticalTable.js by Naohiro OHTA, All Rights Reserved.
 */

var NAVerticalTable = function(){
	
	// --------------------------------------------
	// Private members
	// --------------------------------------------
	var tr = function(data){return "<tr>" + data + "</tr>";};
	var td1 = function(data){return "<td>" + data + "</td>";};
	var td2 = function(data){return "<td align='left' style='width:100%;word-break:break-all;'>" + data + "</td>";};

	var dig = function(s/*string*/,o/*object*/,parentkey){
		// dig function 's private functions.
		var li = function(data){return "<li style='list-style-type:none'>" + data + "</li>";};
		var spanForKey = function(k){return "<span class='key'>" +k+ "</span>";};
		var spanForValue = function(i){return "<span class='value'> " +i+ "</span>";};
		// dig function 's  main procedure.
		for(var k in o){
			var v = o[k];
			var keyInJpn = NALocalizer.toJpn(k);
			var dottedKey = (parentkey) ? parentkey+"."+keyInJpn : keyInJpn;
			if(typeof(v)=='object')
				s = dig(s,v,dottedKey);
			else
				s += li(spanForKey(dottedKey)+spanForValue(v));
		}
		return s;
	};
	
	// --------------------------------------------
	// Public members
	// --------------------------------------------
	return{
		build: function($tbl, records){
			$tbl.empty();
			for(var i=0; i<records.length; i++){
				$tbl.append(tr(td1(i+1)+td2(dig("",records[i]))));
			}
		}
	};
	
}();