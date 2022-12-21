const comprovaDNI = require('../initial-test/dni');

test('Comprova que retorni R aques DNI ', () => {
  expect(comprovaDNI("38113164")).toBe('W');
});


