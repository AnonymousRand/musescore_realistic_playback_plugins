/* Thanks to the makers of the Articulation and Ornamentation Control plugin
 (https://github.com/BernardGreenberg/MuseScorePlugins) for code reference */

import QtQuick 2.0
import MuseScore 3.0
import QtQuick.Dialogs 1.1

MuseScore {
      menuPath: "Plugins.ElementCounter"
      description: "This plugin prints out the number of elements selected."
      version: "1.0"
      requiresScore: true
      
      onRun: {
            // because MuseScore 3.0 was imported
            if ((mscoreMajorVersion < 3)) {
                  versionError.open();
                  Qt.quit();
                  return;
            }
            
            console.log("Element Counter says hello world!");
            
             // get selection in MuseScore
            var selection = curScore.selection;
            var elements = selection.elements;
            numElements.num = elements.length;
            numElements.open();
      }
      
      // UI: version error popup
      MessageDialog {
            id: versionError
            visible: false
            title: qsTr("Unsupported MuseScore Version")
            text: qsTr("This plugin needs MuseScore 3.3 or later")
            onAccepted: {
                  Qt.quit();
            }
      }
      
      // UI: output
      MessageDialog {
            id: numElements
            visible: false
            property int num: 0 // as a parameter
            title: qsTr("yes")
            text: qsTr("Number of elements: %1").arg( num.toString())
            onAccepted: {
                  Qt.quit();
            }
      }
}