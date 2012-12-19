function htmlOfOption(val, text){
	return "<option value='" +val+ "' id='" +val+ "'>" + text + "</option>";
}

function setOptionsToSelect(sel, vals, texts){

	console.log("setOptionsToSelect function (on setOptionsToSelect.js) is called.");
	
	// This is the initial, 1st option text. 
	// This will be delete when you select any option. 
	var Initial_1stOptionText = '-';

	// Empty select element. And append initial 1st option.
	sel.empty();
	sel.append(htmlOfOption(Initial_1stOptionText, Initial_1stOptionText));

	// Append vals and texts.
	if(vals==null)return;
	for(var i=0; i<vals.length; i++){
		sel.append(htmlOfOption(vals[i],texts[i]));
	}
	
	// TODO bug? on iPhone. 'Caz "Selection" drumroll will be not refresh.
	// When you select any option,
	// and if there is initial 1st option, then, delete that option.
	/*
	sel.change(function(){
		var opt1st = sel.find('option:first');
		if(opt1st.val() == Initial_1stOptionText){
			opt1st.remove();
		}
	});
	*/
}


function addOptionToSelect(sel,val){
	sel.append(htmlOfOption(val,val));
}

