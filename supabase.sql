-- FORMA: run this once in Supabase → SQL Editor → New query → Run.
-- One row per saved document (profile, schedule, each workout, each month of logs).
create table if not exists public.forma_docs (
  user_id    uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  key        text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, key)
);

-- Row-level security: each signed-in user can only see and change their own rows.
alter table public.forma_docs enable row level security;

drop policy if exists "Users manage their own FORMA data" on public.forma_docs;
create policy "Users manage their own FORMA data"
  on public.forma_docs
  for all
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);
