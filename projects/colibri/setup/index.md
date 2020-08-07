public: yes
tags: []
comments: false
title: Colibri Setup Guide
summary: Setup guide to configure Colibri on a KDE system

This guide will help you configure your KDE machine to use Colibri instead of
the default Plasma notifications.

## Introduction

Start System Settings and open "Application and System Notifications".

![System Settings](system-settings.jpg)

Go to "Colibri Notifications", notice the warning message. You must disable
Plasma notifications.

![Colibri configuration module, Plasma notification system](colibri-kcm-plasma.jpg)

## Disabling Plasma notifications

Right-click on the (i) icon in the system tray.

![The (i) icon context menu](systemtray-i.jpg)

Uncheck "Application notifications" and click OK.

![Disabling Plasma notifications](disabling-plasma-notifications.jpg)

## Enabling Colibri notifications

Go back to the System Settings window, the warning message should now look like
this.

![Colibri configuration module, no notification system](colibri-kcm-none.jpg)

Click the "Start Colibri" button, Colibri should now be running. You can verify
it with the "Preview" button.

![Colibri configuration module, Colibri is running](colibri-kcm-colibri.jpg)

Your machine is ready to use Colibri. Unless you unchecked "Start Colibri at
login", it should continue to use Colibri next time you login.
