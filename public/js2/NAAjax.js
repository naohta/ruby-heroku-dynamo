/**
 * NAAjax.js by Naohiro OHTA, All Rights Reserved.
 */

var NAAjax = function(){
	var who = "";
	var uri = "./API";
	var browser_s_tab_id = "not yet initialized";
	$(function(){browser_s_tab_id=uuid.v4();});
	
	return{
		ajaxHistory_Req: function(ajax_id, method_obj){}, // Override me
		ajaxHistory_OK: function(ajax_id){}, // Override me
		ajaxHistory_NoUse: function(ajax_id){}, // Override me
		AJAX_ID: -1,
		AJAX_REQUEST_TIME: [],
		setWho: function(uid,pw,$disp){
			who = {
					"uid":uid,
					"tab":browser_s_tab_id,
					"key":CryptoJS.SHA256(uid+"MyogaWebAppYay!!Woo!!Bow!!"+pw).toString(CryptoJS.enc.HEX)
			};
			if($disp!=null) $disp.text(uid);
		},
		ajax: function(method_obj, success_funciton){
			if(who == ""){console.log("'who' is zero length string. so I didnt do ajax call.");return false;}

			this.AJAX_ID++; var ajax_id = this.AJAX_ID; this.AJAX_REQUEST_TIME[ajax_id] = new Date();
			this.ajaxHistory_Req(ajax_id, method_obj);
			console.log("/--- Ajax Request");console.log(method_obj);console.log(who);console.log("---/");
			var that = this;
			$.ajax({
				type:"POST",
				url:uri,
				data:{command: JSON.stringify({method:method_obj,who:who})},
				success:function(result){
						console.log("/--- Ajax Success");console.log(result);console.log("---/");
						success_funciton(result, ajax_id);
						console.log(this);
						that.ajaxHistory_OK(ajax_id);
				},
				error:function(error){
					console.log("/--- Ajax Error");console.log(error);console.log("---/");
				}
			});				
		}
	}
}();

