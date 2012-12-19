/**
 * NALocalizer.js by Naohiro OHTA, All Rights Reserved.
 */

var NALocalizer = function(){
	
	// --------------------------------------------
	// Private members
	// --------------------------------------------
	NAAjax.setWho("noone","this_is_not_secret_data",null);
	var map = [];
	
	// --------------------------------------------
	// Public members
	// --------------------------------------------
	return{
		loadMapFromServer: function(){
			NAAjax.ajax({"name":"getLocalizeMap"},function(result){
				if(result!=null) map = result;
				else map = [];
			});
		},
		toJpn: function(eng){
			if(eng in map) return map[eng];
			else return eng;
		}
	};
}();