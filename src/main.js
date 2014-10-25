/*global module */



/**
 * Runs the tests and renders the results.
 *
 * Call this to run the tests. Then appendChild the return value to display it.
 *
 * @param {Array} tests tests rules to run and render
 * @return {DOMElement} results of each test as an unattached element.
 */
function runTests(tests) {
  tests.forEach(function(rule) {
    try {
      var testFn = rule.shift();

      debugger;
      testFn.apply(null, rule);
      console.log('Success!', rule);

    } catch(e) {
      console.log('Failed!', e);
    }
  });
}

module.exports = {
  runTests: runTests
};