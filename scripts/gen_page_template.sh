SNAKE_CASE_NAME=$(echo $1 | sed 's/[[:upper:]]/_&/g;s/^_//' | tr '[:upper:]' '[:lower:]')
NAME=$1

FULL_PATH=$(pwd)
PACKAGE_NAME=$(basename "$FULL_PATH")

SUFFIX_PAGE="Page"
SUFFIX_PAGE_FILE_NAME="_page.dart"
PARENTS_PAGE_FOLDER="lib/external/pages/$SNAKE_CASE_NAME"
PAGE_FILE_NAME=$SNAKE_CASE_NAME$SUFFIX_PAGE_FILE_NAME

# generate Page
mkdir -p $PARENTS_PAGE_FOLDER

echo "import 'package:${PACKAGE_NAME}/external/base/base_widget.dart';
import 'package:${PACKAGE_NAME}/presenters/controllers/$SNAKE_CASE_NAME/${SNAKE_CASE_NAME}_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class $NAME$SUFFIX_PAGE extends GetWidget<${NAME}Controller> {
  const $NAME$SUFFIX_PAGE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      loading: controller.loadingStatus,
    );
  }
}" >>$PARENTS_PAGE_FOLDER/$PAGE_FILE_NAME

# generate Controller
SUFFIX_CONTROLLER="Controller"
SUFFIX_CONTROLLER_FILE_NAME="_controller.dart"
PARENTS_CONTROLLER_FOLDER="lib/presenters/controllers/$SNAKE_CASE_NAME"
CONTROLLER_FILE_NAME=$SNAKE_CASE_NAME$SUFFIX_CONTROLLER_FILE_NAME
VARIABLE_NAME=$(echo $NAME | awk '{print tolower(substr($0, 1, 1)) substr($0, 2)}')

mkdir -p $PARENTS_CONTROLLER_FOLDER

echo "import 'package:${PACKAGE_NAME}/domain/repositories/$SNAKE_CASE_NAME/i_${SNAKE_CASE_NAME}_repository.dart';
import 'package:${PACKAGE_NAME}/presenters/controllers/base/base_controller.dart';

class $NAME$SUFFIX_CONTROLLER extends BaseController {
  $NAME$SUFFIX_CONTROLLER({required this.${VARIABLE_NAME}Repository});

  final I${NAME}Repository ${VARIABLE_NAME}Repository;
}" >>$PARENTS_CONTROLLER_FOLDER/$CONTROLLER_FILE_NAME

# generate Repository
SUFFIX_REPOSITORY_FILE_NAME="_repository.dart"
PARENTS_REPOSITORY_FOLDER="lib/presenters/repositories/$SNAKE_CASE_NAME"
REPOSITORY_FILE_NAME=$SNAKE_CASE_NAME$SUFFIX_REPOSITORY_FILE_NAME

mkdir -p $PARENTS_REPOSITORY_FOLDER

echo "import 'package:${PACKAGE_NAME}/presenters/shared/api_client/api_client.dart';
import 'package:${PACKAGE_NAME}/domain/repositories/${SNAKE_CASE_NAME}/i_${SNAKE_CASE_NAME}_repository.dart';

class ${NAME}Repository implements I${NAME}Repository {
  ${NAME}Repository({required this.apiClient});

  final ApiClient apiClient;
}" >>$PARENTS_REPOSITORY_FOLDER/$REPOSITORY_FILE_NAME

# generate IRepository
PARENTS_I_REPOSITORY_FOLDER="lib/domain/repositories/$SNAKE_CASE_NAME"
I_REPOSITORY_FILE_NAME="i_$SNAKE_CASE_NAME$SUFFIX_REPOSITORY_FILE_NAME"

mkdir -p $PARENTS_I_REPOSITORY_FOLDER

echo "abstract class I${NAME}Repository {}" >>$PARENTS_I_REPOSITORY_FOLDER/$I_REPOSITORY_FILE_NAME

# generate Binding
SUFFIX_BINDING_FILE_NAME="_binding.dart"
PARENTS_BINDING_FOLDER="lib/presenters/bindings/$SNAKE_CASE_NAME"
BINDING_FILE_NAME=$SNAKE_CASE_NAME$SUFFIX_BINDING_FILE_NAME
PARAM_NAME=$(echo $NAME | awk '{print tolower(substr($0, 1, 1)) substr($0, 2)}')

mkdir -p $PARENTS_BINDING_FOLDER

echo "import 'package:${PACKAGE_NAME}/domain/repositories/$SNAKE_CASE_NAME/i_${SNAKE_CASE_NAME}_repository.dart';
import 'package:${PACKAGE_NAME}/presenters/controllers/$SNAKE_CASE_NAME/${SNAKE_CASE_NAME}_controller.dart';
import 'package:${PACKAGE_NAME}/presenters/repositories/$SNAKE_CASE_NAME/${SNAKE_CASE_NAME}_repository.dart';
import 'package:get/get.dart';

class ${NAME}Binding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<I${NAME}Repository>(() => ${NAME}Repository(apiClient: Get.find()))
      ..lazyPut(() => ${NAME}Controller(${PARAM_NAME}Repository: Get.find()));
  }
}" >>$PARENTS_BINDING_FOLDER/$BINDING_FILE_NAME

echo "$NAME$SUFFIX_PAGE was generated!"
