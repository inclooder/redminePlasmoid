/***************************************************************************
 *   Copyright (C) %{CURRENT_YEAR} by %{AUTHOR} <%{EMAIL}>                            *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents
import "plasmapackage:/code/logic.js" as Logic

Item {
    id: root
   
    property int minimumWidth: 300
    property int minimumHeight: 200
    
    property real hoursSpentToday: 0.0
    property int updateInterval: 3000

    property Component compactRepresentation: CompactRepresentation {
      property real hoursSpentToday: root.hoursSpentToday
    }
    
    Timer {
        repeat: true
        running: true
        triggeredOnStart: true
        interval: root.updateInterval
        onTriggered: Logic.updateHours()
    }
    
    Component.onCompleted: {
      plasmoid.aspectRatioMode = IgnoreAspectRatio;
      plasmoid.popupEvent.connect(popupEventSlot);
      plasmoid.addEventListener('ConfigChanged', Logic.configChanged);	
    }
    
    function popupEventSlot(popped){
      dialogItem.popupShown = popped;
      if(popped) {
	dialogItem.forceActiveFocus();
      }
    }
    
    Popup {
      id: dialogItem
    }
    
    
}
