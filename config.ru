require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use SessionController
use UserController
use JobsiteController
use TaskController
use JobController
use TimeEntryController
use EmployeesController
run ApplicationController
