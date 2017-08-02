script "revPreferencesInspector"
on preOpenStack
   # Set the inspector behaviour
   dispatch "setAsBehavior" to revIDEInspectorBehavior() with the long id of me
   set the navigationDisplayStyle of me to "Names"
end preOpenStack

on openStack
   set the inspectorData of me to revIDEPreferencesInfo()
end openStack

# Sent by an editor when a property value is being changed
on editorValueChanged pProperty, pValue, pLockUpdates
   revIDESetPreference pProperty, pValue
end editorValueChanged

getProp displayData
   return revIDEPreferencesOfSection(inspectorSectionGetName())
end displayData

getProp viewColumns [pSection]
   return 1
end viewColumns

getProp showSubSections [pSection]
   return false
end showSubSections

function inspectorSectionIcon pSection
   switch pSection
      case "general"
         return "home"
      case "appearance"
         return "picture"
      case "files & memory"
         return "files alt"
      case "updates"
         return "download alt"
      case "script editor"
         return "lc-edit-script"
      case "object sizes"
         return "cube"
      case "project browser"
         return "sitemap"
      case "mobile support"
         return "mobile phone"
      default
         return "remove"
         break
   end switch
end inspectorSectionIcon

# Add to header actions/preferences
on inspectorAddActions
end inspectorAddActions

getProp showMultiPropLabels
   return true
end showMultiPropLabels

function inspectorForObjects
   return false
end inspectorForObjects

on idePreferenceChanged pPreference
   inspectorChanged
end idePreferenceChanged
