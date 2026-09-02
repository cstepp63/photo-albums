# My Photo Albums

This is a photo and video slideshow website. It can be viewed on GitHub Pages and edited on a PC.

## What each file does

- `index.html` is the public slideshow website and loads the published comments JSON file.
- `index-edit.html` is the editor used on a PC to add or change comments.
- `Tools/generate-album-list.ps1` and `Tools/run-generate-album-list.cmd` create the slide-list text for a new album.
- Each album has its own comments JSON file inside its main folder.

## Keep originals safe

Keep your original camera photos and videos somewhere safe and separate from this website. Put only smaller, web-ready copies in this project.

## Prepare photos and videos

### Videos: HandBrake

Suggested settings for normal website videos:

- Format: MP4
- Video encoder: H.264
- Preset: Very Fast 720p30
- Web Optimized: checked

Keep the original video. Put the smaller MP4 copy in the appropriate album folder.

### Images: RIOT

Suggested settings:

- Format: JPEG
- Quality: 80%
- Batch Optimizer: maximum width 2400px and maximum height 2400px
- Keep aspect ratio: on
- Resample: Catmull-Rom (slow)
- Keep original date/time: on

Save optimized copies to a new location. Do not overwrite your only originals.

## Add a new album

### 1. Create the folders

Inside the `photo-albums` folder, make a main folder for the album. For example:

```text
2026 Maritimes/
  Aug 26/
    1-Halifax/
    2-Peggys Cove/
```

- Use date folders such as `Aug 26`.
- Use numbered location folders such as `1-Halifax` and `2-Peggys Cove`.
- Put optimized photos and videos in the appropriate location folder.
- Do not rename folders or media after creating the slide list and comments. The names are used to link photos, videos, and comments.

### 2. Generate the slide list

Double-click:

```text
Tools/run-generate-album-list.cmd
```

When asked, type the exact album folder name, for example:

```text
2026 Maritimes
```

The generated file stays in the `Tools` folder, for example:

```text
Tools/2026-maritimes-list.txt
```

Open that file and copy its contents. You do not need to move the file.

### 3. Add the album to the HTML files

Open both `index.html` and `index-edit.html`. Find:

```javascript
const albums = {
```

Copy an existing album section, then change its title, slide list, and folder paths.

- In `index.html`, use a numbered key to keep the menu order, for example `"3-2026-maritimes"`.
- Use the folder name as the title, for example `title: "2026 Maritimes"`.
- Paste the generated lines inside `slides: [ ... ]`.
## Add or change comments

1. Open `index-edit.html` on your PC.
2. Select the album and type comments beside the photos or videos.
3. Comments save automatically in that browser on that PC.
4. Click **Download comments** when finished.
5. Rename the downloaded file to match the album folder. For example:

   ```text
   2026-maritimes-comments.json
   ```

6. Put it inside that album folder:

   ```text
   2026 Maritimes/2026-maritimes-comments.json
   ```

If you rename a photo, video, or folder after adding comments, re-enter the affected comments in `index-edit.html` and download the JSON again. Comments are linked to the exact media path.

## Local viewing and the published website

- When you double-click `index.html` on your PC, a browser cannot load its JSON file directly. It displays comments saved earlier by `index-edit.html` in that same browser.
- On the GitHub Pages website, `index.html` loads each album's comments JSON file.
- `index-edit.html` is for you only. Do not send it as the public website link.

## Upload changes to GitHub

In GitHub Desktop:

1. Check the changed files in the **Changes** tab.
2. Enter a short summary, such as `Add 2026 Maritimes album`.
3. Click **Commit to main**.
4. Click **Push origin**.
5. Wait a minute or two, then open the GitHub Pages website and refresh it. Use `Ctrl + F5` if an older version still appears.

For a new album, upload:

- The updated `index.html`
- The updated `index-edit.html`
- The complete new album folder, including its photos, videos, and comments JSON file
- Any updated tool or README files

## Helpful housekeeping

- The files in `Tools` are safe to keep in GitHub. Generated `*-list.txt` files are only helpers and do not affect the live website.
- `desktop.ini` files are Windows folder settings. They do not harm the website, but can be cleaned out later if desired.
- Keep backups of original media, web-ready copies, comments JSON files, and both HTML files.
