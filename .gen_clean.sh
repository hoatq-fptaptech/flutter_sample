GREEN='\033[1;32m';

directory="$( pwd; )";
libDir="/lib";
dataDir="${libDir}/data/";
domainDir="${libDir}/domain/";

featureName=$1;

featureDataDir="${directory}${dataDir}$featureName";
featureDomainDir="${directory}${domainDir}$featureName";

apiFileName="${featureName}_api.dart";
repositoryImpFileName="${featureName}_repository_impl.dart";
repositoryFileName="${featureName}_repository.dart";
useCaseFileName="${featureName}_usecase.dart";

function writeDataFolder() {
   mkdir -p -- "$featureDataDir";
   createApiFolder;
   createModelsFolder;
   createRepoImpFolder;
   echo "Data folder created";
}

function writeDomainFolder() {
   mkdir -p -- "$featureDomainDir";
   createEntitiesFolder;
   createRepoFolder;
   createUseCasesFolder;
   
   echo "Domain folder created";
}

function createEntitiesFolder(){
   mkdir -p -- "$featureDomainDir/entities"
   echo "$featureName entities folder created";
}

function createRepoFolder(){
   mkdir -p -- "$featureDomainDir/repositories";
   writeRepoTempFile;
   echo "$featureName reposotiries folder created";
}

function writeRepoTempFile(){
   echo "
  abstract class ${featureNameCapitalize}Repository {
}
" > "${featureDomainDir}/repositories/${repositoryFileName}";
}

function createUseCasesFolder(){
   mkdir -p -- "$featureDomainDir/usecases";
   writeUseCaseTempFile;
   echo "$featureName usecases folder created";
}

function writeUseCaseTempFile(){
   echo "import '../repositories/${featureName}_repository.dart';

class ${featureNameCapitalize}UseCase {
  final ${featureNameCapitalize}Repository _repository;

  ${featureNameCapitalize}UseCase(this._repository);
}
" > "${featureDomainDir}/usecases/${useCaseFileName}";
}

function createApiFolder(){
   mkdir -p -- "$featureDataDir/api";
   writeApiTempFile;
   echo "$featureName api folder created";
}

function writeApiTempFile(){
   echo "import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part '${featureName}_api.g.dart';

@RestApi()
abstract class ${featureNameCapitalize}Api {
  factory ${featureNameCapitalize}Api(Dio dio, {String baseUrl}) = _${featureNameCapitalize}Api;
}
" > "${featureDataDir}/api/${apiFileName}";

}

function createModelsFolder(){
   modelsDir="$featureDataDir/models";
   mkdir -p -- "$modelsDir";
   mkdir -p -- "$modelsDir/request"
   mkdir -p -- "$modelsDir/response"
   echo "$featureName models folder created";

}

function createRepoImpFolder(){
   mkdir -p -- "$featureDataDir/repositories"
   writeRepoImpTempFile;
   echo "$featureName repoImp folder created";
}

function writeRepoImpTempFile(){
   echo "import '../api/${featureName}_api.dart';

class ${featureNameCapitalize}RepositoryImpl implements ${featureNameCapitalize}Repository {
  final ${featureNameCapitalize}Api api;

  ${featureNameCapitalize}RepositoryImpl(this.api);
 
}
" > "${featureDataDir}/repositories/${repositoryImpFileName}";
}

echo "${GREEN}========================Generate $featureName Start======================="
arrName=("${featureName//_/ }")
for word in "${arrName[@]}"; do
    # shellcheck disable=SC2006
    # shellcheck disable=SC2021
    capitalizeWord=`echo "${word:0:1}" | tr  '[a-z]' '[A-Z]'`${word:1};
    echo "$capitalizeWord";
    featureNameCapitalize=$featureNameCapitalize$capitalizeWord;
done
echo "Main directory is ${directory}";
writeDataFolder;
writeDomainFolder;

echo "========================Generate $featureName Finish======================="