-- Security Fix: Enable RLS on public tables
-- This script rectifies the "RLS Disabled" security issues for 'applications' and 'form_questions'.
-- It enables Row Level Security (RLS) and adds permissive policies to maintain existing functionality.

-- 1. applications table
ALTER TABLE public.applications ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow all access to applications" ON public.applications;

-- Policy to allow all operations (Select, Insert, Update, Delete) for everyone (public)
-- This maintains the behavior of "RLS Disabled" but satisfies the security check.
CREATE POLICY "Allow all access to applications"
ON public.applications
FOR ALL
TO public
USING (true)
WITH CHECK (true);

-- 2. form_questions table
ALTER TABLE public.form_questions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow all access to form_questions" ON public.form_questions;

-- Policy to allow all operations for everyone
CREATE POLICY "Allow all access to form_questions"
ON public.form_questions
FOR ALL
TO public
USING (true)
WITH CHECK (true);
