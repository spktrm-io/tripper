export const isNullField = (fields: string | string[]) => {
  if (Array.isArray(fields)) {
    return fields.some((field) => !field);
  } else {
    return !fields;
  }
};
