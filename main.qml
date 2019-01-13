/******************************************************************************
    mydatavisualization:  3D Data Visualization based on Qt and QML
    Copyright (C) 2018-2019 yafeilinux <www.qter.org | yafeilinux@163.com>
*   This file is part of effectchart
    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.
    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY.  See the GNU Lesser General Public License
    for more details.
    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
******************************************************************************/

import QtQuick 2.9
import QtQuick.Window 2.2
import QtDataVisualization 1.2

Window {
    visible: true
    width: 800
    height: 450

    Bars3D {
        id: bars3D
        width: parent.width
        height: parent.height
        theme: dynamicColorTheme
        scene.activeCamera.xRotation: 45.0
        scene.activeCamera.yRotation: 5.0
        scene.activeCamera.zoomLevel: 75

        Bar3DSeries {
            id: series
            itemLabelFormat: "@colLabel, @rowLabel: @valueLabel"
            ItemModelBarDataProxy {
                itemModel: dataModel
                rowRole: "year"
                columnRole: "city"
                valueRole: "expenses"
            }
        }
    }

    ListModel {
        id: dataModel
        ListElement{ year: "2018"; city: "beijing";  price: "67822"; }
        ListElement{ year: "2018"; city: "nanjing";  price: "26714"; }
        ListElement{ year: "2018"; city: "shenzhen"; price: "50900"; }
        ListElement{ year: "2018"; city: "hangzhou"; price: "30729"; }
        ListElement{ year: "2017"; city: "beijing";  price: "67951"; }
        ListElement{ year: "2017"; city: "nanjing";  price: "26127"; }
        ListElement{ year: "2017"; city: "shenzhen"; price: "46879"; }
        ListElement{ year: "2017"; city: "hangzhou"; price: "22934"; }
    }

    ThemeColor {
        id: dynamicColor
      //  color: "yellow"
    }

    Theme3D {
        id: dynamicColorTheme
        type: Theme3D.ThemeEbony
        baseColors: [dynamicColor]
        font.pointSize: 50
        labelBorderEnabled: false
        labelBackgroundColor: "transparent"
        labelTextColor: "transparent"
        backgroundColor: "transparent"
        gridLineColor: "transparent"
    }

    SequentialAnimation {
        id: cameraAnimation
        running: true

        NumberAnimation {
            target: bars3D.scene.activeCamera
            property:"xRotation"
            from: 40.0; to: 10.0
            duration: 4000
            easing.type: Easing.InOutBack
        }

        NumberAnimation {
            target: bars3D.scene.activeCamera
            property:"yRotation"
            from: 5.0; to: 45.0
            duration: 3000
            easing.type: Easing.InQuart
        }

        ColorAnimation { target:  dynamicColor;
            property: "color";
            to: "red"; duration: 2000;
            easing.type: Easing.InCirc}
        ColorAnimation {target:  dynamicColor;
            property: "color";
            to: "yellow"; duration: 2000;
            easing.type: Easing.OutCirc}


        NumberAnimation {
            target: bars3D.scene.activeCamera
            property:"xRotation"
            from: 10.0; to:40.0
            duration: 2000
            easing.type: Easing.OutQuad
        }

        ColorAnimation { target:  dynamicColorTheme;
            property: "labelBackgroundColor";
            to: "green"; duration: 1000 ;
            easing.type: Easing.OutQuad}
        ColorAnimation { target:  dynamicColorTheme;
            property: "labelTextColor";
            to: "white"; duration: 1000 ;
            easing.type: Easing.OutQuad}
        ColorAnimation { target:  dynamicColorTheme;
            property: "backgroundColor";
            to: "white"; duration: 1000;
            easing.type: Easing.OutQuad }
        ColorAnimation {target:  dynamicColorTheme;
            property: "gridLineColor";
            to: "green"; duration: 500;
            easing.type: Easing.OutQuad}

        NumberAnimation {
            target: bars3D.scene.activeCamera
            property:"zoomLevel"
            from: 75.0; to:95.0
            duration: 3000
            easing.type: Easing.InOutQuart
        }
    }
}


