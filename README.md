# FORMA — personal training dashboard

A single-page app: `index.html` is the whole app, `config.js` holds your settings.

- **Without setup:** progress is saved in the browser you use (one device).
- **With Supabase (free):** you sign in and your progress syncs across phone and laptop.

---

## Part 1 — Put the site online with GitHub Pages (≈5 min)

1. Sign in at **github.com** → **+** (top right) → **New repository**.
   - Name: `forma` · Visibility: **Public** (free GitHub Pages needs a public repo; your *data* is never stored in the repo).
   - Click **Create repository**.
2. On the new repo page click **uploading an existing file**, drag in
   `index.html`, `config.js`, `supabase.sql`, `README.md` → **Commit changes**.
3. Go to **Settings → Pages**. Under *Build and deployment* choose
   **Source: Deploy from a branch**, **Branch: main**, folder **/ (root)** → **Save**.
4. Wait 1–2 minutes and refresh that page. Your site is at
   `https://YOUR-USERNAME.github.io/forma/`

The app works now, saving progress in that browser. To sync across devices, do Part 2.

## Part 2 — Sync your progress with Supabase (≈10 min, free)

1. Go to **supabase.com** → sign up → **New project**.
   Name `forma`, choose a database password (save it somewhere), region **Paris (eu-west-3)** or Frankfurt → **Create**.
2. When it's ready: **SQL Editor → New query**, paste everything in `supabase.sql`, click **Run**.
   You should see "Success. No rows returned".
3. **Authentication → URL Configuration**: set **Site URL** to your GitHub Pages address
   (`https://YOUR-USERNAME.github.io/forma/`) → Save. This makes the confirmation email link come back to your site.
4. **Project Settings → API** (may be called *Data API* / *API Keys*): copy
   - the **Project URL** (`https://xxxx.supabase.co`)
   - the **anon / public** key (a long string starting `eyJ…`, or `sb_publishable_…`)
5. Back on GitHub, open `config.js` → pencil icon ✏️ → replace the two placeholders → **Commit changes**.
6. Wait a minute, open your site → **Create account** → click the link in the confirmation email → **Sign in**.
7. Optional but recommended: **Authentication → Sign In / Providers** → turn **off** "Allow new users to sign up", so nobody else can create accounts on your project.

### Is it safe to put the key in config.js?
Yes. The anon/public key is designed to be public. The `supabase.sql` script turns on row-level security,
so each signed-in user can only read and write their own rows. **Never** paste the `service_role` key anywhere in the site.

## Moving data from the claude.ai version
In the claude.ai version: **Settings → Your data → All data (JSON)**, then save the text as `forma-backup.json`.
On your new site: **Settings → Import JSON backup**.

## Use it like an app on your phone
Open your site in Safari → Share → **Add to Home Screen** (Android/Chrome: ⋮ → *Add to Home screen*).

## Good to know
- If you're offline, the app keeps working from the last saved copy and syncs once you're back online.
- Supabase's free plan pauses a project after about a week with no use. If that happens, open the Supabase dashboard and click **Restore**. Your data is kept.
- To update the app later, upload a new `index.html` to the repo (Add file → Upload files) and commit.
