# Be sure to restart your server when you modify this file.

# Do not fallback to assets pipeline if a precompiled asset is missed.
Rails.application.config.assets.compile = false

# Generate digests for assets URLs.
Rails.application.config.assets.digest = true

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w(  sales_clerk.js sales_clerk.css sales_office.js sales_office.css )
