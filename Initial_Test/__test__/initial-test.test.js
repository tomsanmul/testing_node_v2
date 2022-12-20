const sum = require('../initial-test/initial-test');

test('adds 1 + 2 to equal 3', () => {
    expect(sum(1, 2)).toBe(3);
});