import QtQuick 2.0
import MuseScore 3.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.1

MuseScore {
      menuPath: "Plugins.BulkTempoChange"
      description: "This plugin allows changing of tempo texts' tempos in bulk."
      version: "1.0"
      pluginType: "dialog" // required to allow GridLayout to show
      requiresScore: true
      
      width: 240
      height: 80
      property int margin: 10
      
      onRun: {
            // Note stuff seems to only work on MuseScore 3.3 and above,
            // so check for that
            if ((mscoreMajorVersion < 3) || (mscoreMinorVersion < 3)) {
	           versionError.open();
                  Qt.quit();
                  return;
            }
            console.log("Bulk Tempo Change says hello world!");
      }
      
      function applyChanges() {
            // get user input from text field
            var offset = parseFloat(tempoChangeInput.text)
            // check if input is valid
            if (isNaN(offset)) {
                  invalidTempoInput.open();
                  Qt.quit();
                  return;
            }
            
            // get selection in MuseScore
            var selection = curScore.selection;
            var elements = selection.elements;
            // apply tempo offset to all tempo text elements in selection
            // (note that this will make the font of the note head smaller; assumedly you're only doing this on invisible elements where this doesn't matter)
            /*
             * WARNING: only works in MuseScore versions (tested in 3.6.2) where a TEMPO_TEXT element is represented in the XML as:
             * <text><b></b><font face="[font]"></font>[notehead character]<b><font face="[font]"></font> = [tempo]</b></text>
             * Otherwise string parsing will break and corrupt your file.
             */
            curScore.startCmd(); // required for operation to be undoable
            for (var i = 0; i < elements.length; i++) {
                  var element = elements[i];
                  if (element.type === Element.TEMPO_TEXT && element.tempoFollowText) {
                        var text = element.text;
                        console.log("before" + text)
                        const regex_whole = / = [0-9.]+/g;
                        const regex_tempo = /[0-9.]+/g;
                        var tempo = parseFloat((text.match(regex_whole)[0]).match(regex_tempo)[0]) + offset; // parenthesized subexpressions don't seem to work with QML, so double regex it is
                        element.text = text.replace(regex_whole, " = " + String(tempo));
                  }
            }
            curScore.endCmd();
            
            Qt.quit();
            return;
      }
      
      // UI: main window
      GridLayout {
            id: "mainLayout"
            anchors.fill: parent
            anchors.margins: 10
            columns: 2

            Label {
                  id: tempoChangeLabel
                  text:  "Tempo Change:"
            }
            TextField {
                  id: tempoChangeInput
                  implicitHeight: 24
                  placeholderText: "0"
                  focus: true
                  Keys.onReturnPressed: {
                        applyChanges();
                  }
                  Keys.onEscapePressed: {
                        Qt.quit();
                  }
            }

            Button {
                  id: applyButton
                  Layout.columnSpan:1
                  text: qsTranslate("PrefsDialogBase", "Apply")
                  onClicked: {
                        applyChanges();
                  }
            }

             Button {
                  id: cancelButton
                  Layout.columnSpan: 1
                  text: qsTranslate("InsertMeasuresDialogBase", "Cancel")
                  onClicked: {
                        Qt.quit();
                  }
            }
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
      
      // UI: invalid tempo input popup
      MessageDialog {
            id: invalidTempoInput
            visible: false
            title: qsTr("Invalid Tempo Input")
            text: qsTr("Enter a numerical value")
            onAccepted: {
                  Qt.quit();
            }
      }
}
