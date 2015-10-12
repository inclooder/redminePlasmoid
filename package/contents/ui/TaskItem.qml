import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents


FocusScope {
      id: dialog
      property bool popupShown // somehow plasmoid.popupShowing isn't working
      focus: true
      PlasmaComponents.Button {
	text: "costam"
      }
}