const comprovaDNI = require('../initial-test/dni');


test('Comprovo que no li passi buit o undefined el DNI', () => {
  expect(comprovaDNI("")).toBe(false);
});


test('Comprovo que la longitud del dni sigui de 8 numeros', () => {
  expect(comprovaDNI("85758676584764")).toBe(false);
  expect(comprovaDNI("257586")).toBe(false);
});


test('Comprova que retorni les lletres correctes a aquests DNIs ', () => {
  expect(comprovaDNI("38113164")).toBe('W');
  expect(comprovaDNI("37239594")).toBe('H');
  expect(comprovaDNI("47718419")).toBe('C');
});

