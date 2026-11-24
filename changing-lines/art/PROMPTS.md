# Changing Lines: art prompts

The game draws its own art in code. To use painted art instead, generate (or commission) images with the prompts below, save them in this folder, and list them in `art/manifest.json`. Any key in the manifest replaces the drawn version; anything missing keeps the drawn art.

```json
{
  "card:dragon": "art/cards/dragon.webp",
  "fighter:hero": "art/fighters/hero.webp"
}
```

- Card art: 1000×720 px (ratio 100:72), the subject centred, leaving the lower-right corner calm (the hexagram seal sits there).
- Fighters: transparent PNG/WebP, 600×800 px, full body, **facing right**, feet near the bottom edge (opponents are mirrored in game).

## Where to put the files on GitHub

Repository: **https://github.com/Antgu/personalRepo**, branch **`ccr-ff936230-ougcdb`** (the branch the game lives on; use `main` instead once it has been merged).

| What | Folder in the repo | File name | Manifest key |
|---|---|---|---|
| Card and weapon art | `changing-lines/art/cards/` | the key after `card:`, e.g. `dragon.webp`, `jian.webp` | `"card:dragon": "art/cards/dragon.webp"` |
| Fighters | `changing-lines/art/fighters/` | the key after `fighter:`, e.g. `hero.png` | `"fighter:hero": "art/fighters/hero.png"` |
| Manifest | `changing-lines/art/manifest.json` | (already exists, starts as `{}`) | one line per image |

Rules:
- Name each file exactly after its key in the tables below (lowercase, as written, e.g. `returnFist.webp`, `f_spring.webp`, `s_jian.webp`).
- Paths in the manifest are relative to `changing-lines/`, so they start with `art/…`, not `changing-lines/art/…`.
- Prefer `.webp` (or `.png` for fighters with transparency). Keep each image under about 400 KB; a full set should stay well under 20 MB.
- You don't need the whole set at once. Any image you leave out keeps the drawn art.

### Upload in the browser (no git needed)

1. Open https://github.com/Antgu/personalRepo/tree/ccr-ff936230-ougcdb/changing-lines/art
2. **Add file → Upload files**. To create the subfolder, drag in a folder named `cards` (or `fighters`) containing the images; GitHub keeps the folder name.
3. Commit directly to `ccr-ff936230-ougcdb`.
4. Open `manifest.json` in the same folder, click the pencil icon, add one line per image, and commit. For example:

```json
{
  "card:dragon": "art/cards/dragon.webp",
  "card:guard": "art/cards/guard.webp",
  "fighter:hero": "art/fighters/hero.png"
}
```

(Every line except the last ends with a comma.)

### Or with git

```bash
git clone https://github.com/Antgu/personalRepo.git
cd personalRepo
git checkout ccr-ff936230-ougcdb
mkdir -p changing-lines/art/cards changing-lines/art/fighters
# copy your images into those folders, then edit changing-lines/art/manifest.json
git add changing-lines/art
git commit -m "Add painted art for Changing Lines"
git push origin ccr-ff936230-ougcdb
```

### After pushing

The published game page does not read from GitHub by itself. Once the images are pushed, ask Claude to "republish Changing Lines with the new art": it pulls the branch, checks the manifest against the files, and publishes the images with the page. To preview locally, run `npx serve changing-lines` from the repo root and open the address it prints (opening `index.html` directly as a file won't load the manifest).

## Shared style line (append to every prompt)

> Style: Chinese fantasy (guofeng) digital watercolour illustration. Pale, luminous off-white background with soft blooms of pink and crimson wash; flowing translucent silk ribbons and sleeves in crimson and blush; scattered falling red petals; fine gold filigree lines; delicate ink linework on faces and hands; painterly, airy, high detail, dynamic diagonal composition, no text, no border, no watermark.

## Fighters

| Key | Prompt |
|---|---|
| `fighter:hero` | The Wanderer, a young swordswoman in flowing blush and crimson hanfu with long silk ribbons, high ponytail with a red ribbon, poised in a wide martial stance holding a weapon forward |
| `fighter:shen` | Disciple Shen of the Stone Gate Hall, a bald young monk in grey-beige robes and prayer beads, holding a long wooden staff, steady stance |
| `fighter:lei` | Adept Lei of the Thunder Step Sect, lavender and indigo robes, gold headband with trailing tails, twin hook swords, crackling light at the feet |
| `fighter:hua` | Lantern Keeper Hua of the Crimson Lantern Society, peach and amber robes, an open painted iron fan, red paper lanterns glowing behind |
| `fighter:master` | The Master of Changes, white and silver robes, a wide straw hat with a sheer white veil, a straight sword, a pale golden aura and a faint taiji moon |

## Cards

| Key | Card | Hexagram | Subject |
|---|---|---|---|
| `card:guard` | Receptive Guard | 2 | a martial artist raising an open palm, a faint circular shield of gold light |
| `card:returnFist` | Returning Fist | 24 | a fist pulling back in a circular arc, wind trailing behind |
| `card:approach` | Approaching Step | 19 | light footsteps gliding forward over still water |
| `card:peace` | Peaceful Palm | 11 | a palm strike in front of a rising red sun |
| `card:thunder` | Thunder Step | 51 | a leaping kick with forked lightning crackling around the leg |
| `card:willow` | Willow Sway | 57 | a figure swaying beneath long willow branches |
| `card:still` | Stone Stance | 52 | a figure standing rooted like a boulder, moss and stone |
| `card:gate` | Closed Gate | 12 | two hands closing in front of an old timber gate |
| `card:dragon` | Hidden Dragon Palm | 1 | a sinuous dragon of mist coiling around an outstretched palm, a golden pearl |
| `card:breakthrough` | Breakthrough Fist | 43 | a fist bursting through a cracked brick wall |
| `card:meet` | Coming to Meet | 44 | two swords crossing, sparks and petals |
| `card:power` | Great Power | 34 | a great ram-horned spirit behind a warrior gathering strength |
| `card:abyss` | River Turning | 29 | a whirlpool of water turning around a defending figure |
| `card:clinging` | Clinging Flame | 30 | a ribbon of flame clinging to a spinning fan |
| `card:biting` | Biting Through | 21 | jaws of shadow biting through a staff |
| `card:upward` | Pushing Upward | 46 | a sapling surging upward, a warrior rising with it |
| `card:modesty` | Modest Bow | 15 | a warrior bowing with fist-in-palm salute before a mountain |
| `card:increase` | Increase | 42 | bronze coins rising in a spiral of light |
| `card:decrease` | Decrease | 41 | a jar pouring water into a bowl, calm hands |
| `card:before` | Before Completion | 64 | a small fox crossing a river at dawn, fire above water |
| `card:after` | After Completion | 63 | a bronze kettle over a small flame, steam curling |
| `card:treading` | Tiger's Tail Step | 10 | stepping lightly on the tail of a sleeping tiger |
| `card:drum` | Rousing Drum | 16 | a war drum struck, sound rings visible as silk ripples |
| `card:duration` | Enduring Pine | 32 | an old pine bent by wind but unbroken |
| `card:split` | Splitting Apart | 23 | a mountain split in two by a falling blade |
| `card:army` | Ranks of the Army | 7 | three silk banners on spears in a misty field |
| `card:feint` | Joyous Lake Feint | 58 | a koi flashing beneath lake ripples, a feinting sleeve |
| `card:taming` | Small Taming | 9 | dense clouds gathering without rain, birds wheeling |
| `card:sprout` | Sprouting Blade | 3 | a sword blade sprouting from the soil with green shoots |
| `card:f_spring` | Spring Thunder Strike | 25 | a plum blossom branch struck by spring thunder |
| `card:f_ascend` | Great Power Surge | 34 | a dragon ascending vertically toward a red sun |
| `card:f_mountain` | Immovable Mountain | 23 | a mountain crowned with a golden halo, a still warrior before it |
| `card:s_jian` | Cloud-Piercing Thrust | 26 | a straight sword thrust piercing a cloud |
| `card:s_dao` | Whirlwind Cut | 54 | a broad saber cutting a whirlwind of petals |
| `card:s_spear` | Dragon Leaves the Sea | 5 | a red-tassel spear bursting from sea waves like a dragon |
| `card:s_fan` | Folding Moon | 20 | an iron fan opened against a crescent moon |
| `card:s_staff` | Sweeping Staff | 8 | a monk's staff sweeping in a wide arc of dust |
| `card:s_hooks` | Twin Hook Snare | 40 | twin hook swords catching a lightning bolt |

## Weapons (Bag and weapon choice)

| Key | Subject |
|---|---|
| `card:jian` | a straight jian sword with a red tassel, laid diagonally on silk with petals |
| `card:dao` | a curved broad saber with a red cloth, laid diagonally on silk with petals |
| `card:spear` | a red-tassel spear, laid diagonally on silk with petals |
| `card:fan` | an open iron fan painted with a red sun, laid diagonally on silk with petals |
| `card:staff` | a monk's staff with brass bands, laid diagonally on silk with petals |
| `card:hooks` | a pair of hook swords, laid diagonally on silk with petals |
