# My Photo Albums

This project displays my photo and video albums as a slideshow website. It has:

- `index.html` — the regular viewer for the published GitHub Pages website.
- `index-edit.html` — the comment editor used on my PC.
- `generate-album-list.ps1` and `run-generate-album-list.cmd` — helpers that make the slide list for a new album.
- One comments JSON file inside each album folder.

## Important: keep originals safe

Keep the original camera photos and videos in a separate backup folder. Make smaller, web-ready copies for this website.

## 1. Optimize videos with HandBrake

Suggested settings for ordinary website videos:

- Format: MP4
- Video encoder: H.264
- Preset: Very Fast 720p30
- Check: Web Optimized

Keep the original video. Put the smaller MP4 copy in the appropriate location folder.

## 2. Optimize images with RIOT

Suggested settings:

- Format: JPEG
- Quality: 80%
- Batch Optimizer: maximum width 2400px and maximum height 2400px
- Keep aspect ratio: on
- Resample: Catmull-Rom (slow)
- Keep original date/time: on

Save the optimized copies to a new location. Do not overwrite your only original images.

## 3. Organize a new album

Create the main album folder in the `photo-albums` folder, for example:

```text
2027 Maritimes/
  Aug 27/
    1-Halifax/
    2-Peggy's Cove/
```

- Use date folders, such as `Aug 27`.
- Use numbered location folders, such as `1-Halifax` and `2-Peggy's Cove`.
- Put the optimized images and videos in the appropriate location folder.
- Folder and file names must stay exactly the same after making the slide list. GitHub is case-sensitive.

## 4. Generate the slide list

Keep these two helper files in the main `photo-albums` folder, beside all album folders:

- `generate-album-list.ps1`
- `run-generate-album-list.cmd`

Double-click `run-generate-album-list.cmd`, then type the exact album folder name, for example:

```text
2027 Maritimes
```

It creates a file such as `2027-maritimes-list.txt` in the main `photo-albums` folder. The window will tell you where the file was created.

Move that text file into the matching album folder when you are ready to keep it there. Open it, copy its contents, and paste the lines into the new album's `slides: [` section.

## 5. Add the album to both HTML files

Open both `index.html` and `index-edit.html`. Find:

```javascript
const albums = {
```

Use an existing album as the example and add the new album in both files.

- Number the album key so menu order stays correct, for example `"2-2027-maritimes"`.
- Use the folder name for the title, for example `title: "2027 Maritimes"`.
- Paste the generated slide-list lines after `slides: [`.
- In `index.html`, add a casual password line for the new album, for example:

```javascript
password: "your-shared-album-password",
```

This password is only for casual privacy. Because the website is public, it is not secure against someone who knows how to inspect website files. Do not reuse a personal password.

## 6. Add comments

1. Open `index-edit.html` on your PC.
2. Select the album and type comments beside the photos.
3. Comments save automatically in that browser on that PC.
4. Click **Download comments** when finished to create a JSON backup.
5. Rename the downloaded file to match the album folder. For example:

```text
2027-maritimes-comments.json
```

6. Put the JSON file inside the matching album folder:

```text
2027 Maritimes/2027-maritimes-comments.json
```

The published website loads the JSON file. When `index.html` is double-clicked on a PC, it uses the browser's locally saved comments instead, because browsers block direct JSON loading from `file:///` pages.

## 7. Upload to GitHub

Commit and push:

- The updated `index.html`
- The updated `index-edit.html` (optional to publish, but useful to keep backed up)
- The entire new album folder, including photos, videos, and its comments JSON file
- Any helper files and this README if you want them backed up in GitHub

After GitHub Pages updates, open the website's `https://` address and test the new album, comments, videos, and password.

## Backups

Keep backups of:

- Original photos and videos
- Optimized web copies
- Each album's comments JSON file
- The `index.html` and `index-edit.html` files
