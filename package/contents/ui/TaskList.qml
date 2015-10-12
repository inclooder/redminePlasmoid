import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents
import "plasmapackage:/code/logic.js" as Logic


Rectangle {
      color: "transparent"
      width: 300
      height: 200
    /*
      anchors: {
	top: parent.top
	bottom: parent.bottom
	left: parent.left
	right: parent.right
      }*/
    
    
      Timer {
        repeat: true
        running: true
        triggeredOnStart: true
        interval: 5000
        onTriggered: Logic.updateTasks()
      }
     
      ListModel {
        id: tasksModel
      }
      Component {
        id: myDelegate
        Row {
	  spacing: 5
	  Text {	
	    text: task_id	
	  }
	  Text { 
	    text: subject
	  }
	  
	  Image {
	    //anchors.right: parent.right
	    width: parent.height
	    height: parent.height
	    source: "plasmapackage:/images/icon-play-128.png"
	  } 
	}
      }
      ListView {
	spacing: 5
        anchors.fill: parent
        model: tasksModel
        delegate: myDelegate
        //highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        //focus: true
      }
   
}