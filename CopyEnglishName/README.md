> 🌐 **Homepage**: <https://liuxl.com.cn/CopyEnglishName/>

# CopyEnglishName

CopyEnglishName is a World of Warcraft addon for looking up and copying the English name of an item.

It supports:

- `/en [itemLink]`
- `/en <itemId>`
- `/en <Chinese item name>`

The addon opens a copyable popup and preselects the English item name so it can be copied quickly.

## What This Addon Does

- Looks up item names only
- Converts a Chinese item name to its English item name
- Reads item data from a separate load-on-demand data addon
- Uses chunked Lua tables to keep the main addon lightweight

## What This Addon Does Not Do

- It does not scan tooltips automatically
- It does not support spells
- It does not support NPC names
- It does not copy directly to the system clipboard

## Installation

1. Place both `CopyEnglishName` and `CopyEnglishName_Data` inside `World of Warcraft/_retail_/Interface/AddOns/`.
2. Restart the game client.
3. Enable both addons from the in-game addon list.

## Usage

Use one of the following commands in chat:

- `/en [itemLink]`
- `/en 19019`
- `/en <Chinese item name>`

If the item is found, a popup will appear with the English name selected in the edit box.

## Project Structure

```text
CopyEnglishName/
  CopyEnglishName/
    CopyEnglishName.toc
    ItemDatabase.lua
    logo.tga
    README.md
  CopyEnglishName_Data/
    CopyEnglishName_Data.toc
    lua_chunks/
      item_names_1.lua
      item_names_2.lua
      ...
```

## Technical Notes

- Main addon logic lives in `CopyEnglishName/ItemDatabase.lua`.
- The data addon is loaded on demand through `C_AddOns.LoadAddOn`.
- Item data is split into sequential global tables named `ItemNames_1`, `ItemNames_2`, and so on.

## License

MIT License.
