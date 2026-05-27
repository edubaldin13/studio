ALTER TABLE public.generations
  ADD COLUMN IF NOT EXISTS input_tokens INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS output_tokens INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS cost_usd NUMERIC(10, 6) DEFAULT 0;

CREATE INDEX IF NOT EXISTS idx_generations_cost
  ON public.generations(created_at, cost_usd)
  WHERE cost_usd > 0;