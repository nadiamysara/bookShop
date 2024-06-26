plugin "git"
plugin "env"
plugin "bundler"
plugin "rails"
plugin "nodenv"
plugin "puma"
#plugin "rbenv"
plugin "./plugins/bookShop.rb"
plugin "sidekiq"

# host "deploy@128.199.149.87"
# host "deployer@68.183.235.219"
host "deploy@159.65.1.41"
# host "deployer@165.22.249.248" can't. Tomo is designed such that only one application can be deployed to a given user@host. To deploy multiple applications to the same host, use a separate deployer user per app.

set application: "bookShop"
set deploy_to: "/home/deploy/%{application}"
# set deploy_to: "/var/www/%{application}"
# set nodenv_node_version: "20.12.2"
set nodenv_node_version: "20.11.0"
set nodenv_install_yarn: true
# set git_url: "https://github.com/nadiamysara/bookShop.git"
set git_url: "git@github.com:nadiamysara/bookShop.git"
set git_branch: "main"
set git_exclusions: %w[
  .tomo/
  spec/
  test/
]
set env_vars: {
  RACK_ENV: "production",
  RAILS_ENV: "production",
  RAILS_LOG_TO_STDOUT: "1",
  RAILS_SERVE_STATIC_FILES: "1",
  RUBY_YJIT_ENABLE: "1",
  BOOTSNAP_CACHE_DIR: "tmp/bootsnap-cache",
  DATABASE_URL: :prompt,
  SECRET_KEY_BASE: :prompt
}
set linked_dirs: %w[
  .yarn/cache
  log
  node_modules
  public/assets
  public/packs
  public/vite
  tmp/cache
  tmp/pids
  tmp/sockets
]

set linked_files: %w[
  config/database.yml
]

setup do
  run "env:setup"
  run "core:setup_directories"
  run "git:config"
  run "git:clone"
  run "git:create_release"
  run "core:symlink_shared"
  run "nodenv:install"
  # run "rbenv:install"
  run "bundler:upgrade_bundler"
  run "bundler:config"
  run "bundler:install"
  #run "rails:db_create"
  #run "rails:db_schema_load"
  #run "rails:db_seed"
  run "puma:setup_systemd"
  run "sidekiq:setup_systemd"
end

deploy do
  run "env:update"
  run "git:create_release"
  run "core:symlink_shared"
  run "core:write_release_json"
  run "bundler:install"
  run "rails:db_create"
  run "rails:db_migrate"
  run "rails:db_seed"
  run "rails:assets_precompile"
  run "core:symlink_current"
  run "puma:restart"
  run "puma:check_active"
  run "core:clean_releases"
  run "bundler:clean"
  run "core:log_revision"
  run "sidekiq:restart"
end
