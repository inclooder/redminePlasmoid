
function updateHours(){
  var today = new Date();
  today = today.toISOString().substring(0, 10);
  var url = getRedmineUrl() + "/time_entries.json?from=" + today;
  request(url, function(xhr){
    if(xhr.readyState == 4 && xhr.status == 200){
      var d = eval('new Object(' + xhr.responseText + ')');
      var timeSpent = 0.0;
      for (index = 0; index < d.time_entries.length; ++index) {
	if(d.time_entries[index].user.id == 41){
	  timeSpent += parseFloat(d.time_entries[index].hours);
	}
	
      }
      root.hoursSpentToday = timeSpent;
    }
  });
}

function getRedmineUrl(){
  return plasmoid.readConfig('redmineUrl').toString().replace(/(\/)+$/, '');
}

function updateTasks(){
  var url = getRedmineUrl() + "/issues.json?assigned_to_id=me";
  request(url, function(xhr){
    if(xhr.readyState == 4 && xhr.status == 200){
      var d = eval('new Object(' + xhr.responseText + ')');
      tasksModel.clear();
      for (index = 0; index < d.issues.length; ++index) {
	tasksModel.append({ task_id: d.issues[index].id, subject: d.issues[index].subject});	
      }
      
    }
  });
}


function updateLogic(){
  updateHours();
  
}


function request(url, callback) {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = (function f() {callback(xhr)});
 // xhr.setRequestHeader("Accept-Charset", "ISO-8859-1");
  //xhr.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
  //xhr.overrideMimeType('text/xml');
  xhr.open('GET', url, true);
  xhr.send();
}

function configChanged(){
  root.updateInterval = plasmoid.readConfig('updateInterval');
}