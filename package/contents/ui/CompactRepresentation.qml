import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents


Item {
      property real hoursSpentToday: 0.0
      
      Image {
	    width: parent.height
	    height: parent.height
	    fillMode: Image.PreserveAspectFit
	    smooth: true
	    source: "plasmapackage:/images/redmine.png"
      } 
      Text {
	 anchors.horizontalCenter: parent.horizontalCenter
	 anchors.bottom: parent.bottom
	 anchors.bottomMargin: 2
	 font.pixelSize: 11
	 text: " " + hoursSpentToday.toFixed(1)
	 color: (hoursSpentToday >= 8) ? "green" : "black"
      }
}