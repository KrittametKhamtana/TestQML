////import QtQuick 2.0
////import QtQuick.Window 2.0
////import QtLocation 5.6
////import QtPositioning 5.6

////Window {
////    width: 512
////    height: 512
////    visible: true

////    Plugin {
////        id: mapPlugin
////        name: "osm" // "mapboxgl", "esri", ...
////        // specify plugin parameters if necessary
////        // PluginParameter {
////        //     name:
////        //     value:
////        // }
////    }

////    Map {
////        anchors.fill: parent
////        plugin: mapPlugin
////        center: QtPositioning.coordinate(59.91, 10.75) // Oslo
////        zoomLevel: 14
////    }

////}

//import QtQuick 2.0
//import QtQuick.Window 2.0
//import QtLocation 5.6
//import QtPositioning 5.6

//Window {
//width: 512
//height: 512
//visible: true

//Plugin {
//id: mapboxglPlugin
//name: "mapboxgl"
//}

//Map {
//anchors.fill: parent
//plugin: mapboxglPlugin
//center: QtPositioning.coordinate(59.91, 10.75) // Oslo
//zoomLevel: 14
//}
//}

import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtLocation 5.6
import QtPositioning 5.6

ApplicationWindow {
    visible: true
    width: 700
    height: 520
    title: qsTr("TestQML")

    TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("Home")
        }
        TabButton {
            text: qsTr("Map")
        }
        TabButton {
            text: qsTr("Activity")
        }
    }

    SwipeView {
        width: parent.width
        currentIndex: bar.currentIndex
        Item {
            id: homeTab

            ToolTip {
                id: toast
                delay: 500
                timeout: 3000
                x: (parent.width - width) / 2
                y: (parent.height - 100)

                background: Rectangle {
                    color: "gray"
                    radius: 15
                }
            }

            Text {
                id: text_1
                text: qsTr("Press Button")

                anchors {
                    top: parent.top
                    topMargin: 50
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Button {
                anchors {
                    top: parent.top
                    topMargin: 450
                    right: parent.horizontalCenter
                    margins: 8

                }

                text: qsTr("Ok")
                onClicked: {
                    text_1.text = qsTr("OK Button is Pressed")
                    toast.text = qsTr("Toast OK Button is pressed")
                    toast.visible = true
                    toast.topMargin = 420
                }

            }

            Button {
                anchors {
                    top: parent.top
                    topMargin: 450
                    left: parent.horizontalCenter
                    margins: 8

                }

                text: qsTr("Cancel")
                onClicked: text_1.text = qsTr("Cancel Button is Pressed")
            }
        }
        Item {
            id: discoverTab
            Rectangle {
                width: parent.width
                height: 512
                y:40
                visible: true
                Plugin {
                    id: mapboxglPlugin
                    name: "mapboxgl"
                }

                Map {
                    anchors.fill: parent
                    plugin: mapboxglPlugin
                    center: QtPositioning.coordinate(59.91, 10.75) // Oslo
                    zoomLevel: 14
                }
            }
        }
        Item {
            id: activityTab
        }
    }


    //    ToolTip {
    //           id: toast
    //           delay: 500
    //           timeout: 3000
    //           x: (parent.width - width) / 2
    //           y: (parent.height - 100)

    //           background: Rectangle {
    //               color: "gray"
    //               radius: 15
    //           }
    //       }

    //    Text {
    //        id: text_1
    //        text: qsTr("Press Button")

    //        anchors {
    //            top: parent.top
    //            topMargin: 50
    //            horizontalCenter: parent.horizontalCenter
    //        }
    //    }

    //    Button {
    //        anchors {
    //            left: parent.left
    //            bottom: parent.bottom
    //            right: parent.horizontalCenter
    //            margins: 8
    //        }

    //        text: qsTr("Ok")
    //        onClicked: {
    //            text_1.text = qsTr("OK Button is Pressed")
    //            toast.text = qsTr("Toast OK Button is pressed")
    //            toast.visible = true
    //        }

    //    }

    //    Button {
    //        anchors {
    //            right: parent.right
    //            bottom: parent.bottom
    //            left: parent.horizontalCenter
    //            margins: 8
    //        }

    //        text: qsTr("Cancel")
    //        onClicked: text_1.text = qsTr("Cancel Button is Pressed")
    //    }
}

