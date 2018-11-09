import { module, test } from 'qunit';
import { setupTest } from 'ember-qunit';
import { newSession } from 'stage/tests/helpers/sessions/sign-in';
import setupMirage from 'ember-cli-mirage/test-support/setup-mirage';

module('Unit | Route | Application', function(hooks) {
  setupTest(hooks);
  setupMirage(hooks);

  hooks.beforeEach(async function() {
    await newSession(this);
  });

  test('Current User is set properly', function(assert) {
    let route = this.owner.lookup('route:application');
    let currentUserService = this.owner.lookup('service:current-user');
    let user = server.schema.users.all().models[0];
    currentUserService.user = user;

    assert.equal(route.currentUser.user, user)
  });
});
