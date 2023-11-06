# frozen_string_literal: true

Sentry.init do |config|
  config.enabled_environments = ['production']

  config.dsn = 'https://9fc839b50e404332bd21a58c0571b8d8@o4506178684125184.ingest.sentry.io/4506179351412736'
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  config.traces_sample_rate = 1.0
end
