/* === This file is part of Calamares - <https://calamares.io> ===
 *
 *   SPDX-FileCopyrightText: 2015 Teo Mrnjavac <teo@kde.org>
 *   SPDX-FileCopyrightText: 2018 Adriaan de Groot <groot@kde.org>
 *   SPDX-License-Identifier: GPL-3.0-or-later
 *
 *   Calamares is Free Software: see the License-Identifier above.
 *
 */

import QtQuick 2.15;
import QtQuick.Controls 1.4;
import QtQuick.Layouts 1.15;
import QtGraphicalEffects 1.12;
import calamares.slideshow 1.0;
import HeeraUI 1.0 as HeeraUI;

Presentation
{
    id: presentation

    Image {
        id: background
        // we're in install media, so we most likely have the backgrounds
        source: "/usr/share/backgrounds/heera/unsplash-4.jpg"
        sourceSize.width: width
        sourceSize.height: height
        fillMode: Image.PreserveAspectCrop
        anchors.fill: parent
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: background.width
                height: background.height
                Rectangle {
                    anchors.centerIn: parent
                    width: background.width
                    height: background.height
                    radius: HeeraUI.Theme.bigRadius
                }
            }
        }
    }

    Slide {}
    
    function onActivate() {
        presentation.currentSlide = 0;
    }

    function onLeave() {}

    Timer {
        id: timer
        interval: 10000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: nextSlide()
    }

    function nextSlide() {
        presentation.goToNextSlide()
    }
}
