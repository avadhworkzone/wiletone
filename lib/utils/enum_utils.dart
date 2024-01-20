enum ImageType { png, svg }

enum ValidationType { password, email, pNumber, name, username, amount }

enum LangType { en, gu, hi }

// ignore: constant_identifier_names
enum ServiceType { Income, Expenses, Both }

// ignore: constant_identifier_names
enum DialogCloseType { CloseBtn, AddBtnAndClose, ClickOnDataAndClose }

enum APIHeaderType {
  fileUploadWithToken,
  fileUploadWithoutToken,
  jsonBodyWithToken,
  onlyToken
}
enum APIType { aPost, aGet, aDelete, aPut, aFileUpload }
