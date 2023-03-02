// To parse this JSON data, do
//
//     final prediction = predictionFromJson(jsonString);

import 'dart:convert';

Prediction predictionFromJson(String str) =>
    Prediction.fromJson(json.decode(str));

String predictionToJson(Prediction data) => json.encode(data.toJson());

class Prediction {
  Prediction({
    required this.prediction,
  });

  PredictionClass prediction;

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        prediction: PredictionClass.fromJson(json["prediction"]),
      );

  Map<String, dynamic> toJson() => {
        "prediction": prediction.toJson(),
      };
}

class PredictionClass {
  PredictionClass({
    required this.uuid,
    required this.versionId,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
    required this.status,
    required this.inputs,
    this.output,
    required this.outputFiles,
    this.error,
    this.runLogs,
    required this.version,
    this.user,
  });

  String uuid;
  String versionId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic completedAt;
  String status;
  Inputs inputs;
  dynamic output;
  List<dynamic> outputFiles;
  dynamic error;
  dynamic runLogs;
  PredictionVersion version;
  dynamic user;

  factory PredictionClass.fromJson(Map<String, dynamic> json) =>
      PredictionClass(
        uuid: json["uuid"],
        versionId: json["version_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        completedAt: json["completed_at"],
        status: json["status"],
        inputs: Inputs.fromJson(json["inputs"]),
        output: json["output"],
        outputFiles: List<dynamic>.from(json["output_files"].map((x) => x)),
        error: json["error"],
        runLogs: json["run_logs"],
        version: PredictionVersion.fromJson(json["version"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "version_id": versionId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "completed_at": completedAt,
        "status": status,
        "inputs": inputs.toJson(),
        "output": output,
        "output_files": List<dynamic>.from(outputFiles.map((x) => x)),
        "error": error,
        "run_logs": runLogs,
        "version": version.toJson(),
        "user": user,
      };
}

class Inputs {
  Inputs({
    required this.img,
    required this.tile,
    required this.scale,
    required this.version,
  });

  String img;
  int tile;
  int scale;
  String version;

  factory Inputs.fromJson(Map<String, dynamic> json) => Inputs(
        img: json["img"],
        tile: json["tile"],
        scale: json["scale"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "tile": tile,
        "scale": scale,
        "version": version,
      };
}

class PredictionVersion {
  PredictionVersion({
    required this.config,
    required this.dockerImageId,
    required this.dockerImageName,
    required this.openapiSchema,
    required this.model,
  });

  Config config;
  String dockerImageId;
  String dockerImageName;
  OpenapiSchema openapiSchema;
  Model model;

  factory PredictionVersion.fromJson(Map<String, dynamic> json) =>
      PredictionVersion(
        config: Config.fromJson(json["config"]),
        dockerImageId: json["docker_image_id"],
        dockerImageName: json["docker_image_name"],
        openapiSchema: OpenapiSchema.fromJson(json["openapi_schema"]),
        model: Model.fromJson(json["model"]),
      );

  Map<String, dynamic> toJson() => {
        "config": config.toJson(),
        "docker_image_id": dockerImageId,
        "docker_image_name": dockerImageName,
        "openapi_schema": openapiSchema.toJson(),
        "model": model.toJson(),
      };
}

class Config {
  Config({
    required this.build,
    required this.image,
    required this.predict,
  });

  Build build;
  String image;
  String predict;

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        build: Build.fromJson(json["build"]),
        image: json["image"],
        predict: json["predict"],
      );

  Map<String, dynamic> toJson() => {
        "build": build.toJson(),
        "image": image,
        "predict": predict,
      };
}

class Build {
  Build({
    required this.gpu,
    required this.cuda,
    required this.cudnn,
    required this.pythonVersion,
    required this.pythonPackages,
    required this.systemPackages,
  });

  bool gpu;
  String cuda;
  String cudnn;
  String pythonVersion;
  List<String> pythonPackages;
  List<String> systemPackages;

  factory Build.fromJson(Map<String, dynamic> json) => Build(
        gpu: json["gpu"],
        cuda: json["cuda"],
        cudnn: json["cudnn"],
        pythonVersion: json["python_version"],
        pythonPackages:
            List<String>.from(json["python_packages"].map((x) => x)),
        systemPackages:
            List<String>.from(json["system_packages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "gpu": gpu,
        "cuda": cuda,
        "cudnn": cudnn,
        "python_version": pythonVersion,
        "python_packages": List<dynamic>.from(pythonPackages.map((x) => x)),
        "system_packages": List<dynamic>.from(systemPackages.map((x) => x)),
      };
}

class Model {
  Model({
    required this.absoluteUrl,
    required this.username,
    required this.name,
    required this.description,
    required this.visibility,
    required this.githubUrl,
    required this.paperUrl,
    required this.arxivPaperId,
    required this.coverImage,
    this.latestVersionCreatedAt,
    required this.defaultExampleUuid,
    required this.displayOutputAsJson,
  });

  String absoluteUrl;
  String username;
  String name;
  String description;
  String visibility;
  String githubUrl;
  String paperUrl;
  String arxivPaperId;
  CoverImage coverImage;
  dynamic latestVersionCreatedAt;
  String defaultExampleUuid;
  bool displayOutputAsJson;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        absoluteUrl: json["absolute_url"],
        username: json["username"],
        name: json["name"],
        description: json["description"],
        visibility: json["visibility"],
        githubUrl: json["github_url"],
        paperUrl: json["paper_url"],
        arxivPaperId: json["arxiv_paper_id"],
        coverImage: CoverImage.fromJson(json["cover_image"]),
        latestVersionCreatedAt: json["latest_version_created_at"],
        defaultExampleUuid: json["default_example_uuid"],
        displayOutputAsJson: json["display_output_as_json"],
      );

  Map<String, dynamic> toJson() => {
        "absolute_url": absoluteUrl,
        "username": username,
        "name": name,
        "description": description,
        "visibility": visibility,
        "github_url": githubUrl,
        "paper_url": paperUrl,
        "arxiv_paper_id": arxivPaperId,
        "cover_image": coverImage.toJson(),
        "latest_version_created_at": latestVersionCreatedAt,
        "default_example_uuid": defaultExampleUuid,
        "display_output_as_json": displayOutputAsJson,
      };
}

class CoverImage {
  CoverImage({
    required this.url,
    required this.isAudioVideo,
  });

  String url;
  bool isAudioVideo;

  factory CoverImage.fromJson(Map<String, dynamic> json) => CoverImage(
        url: json["url"],
        isAudioVideo: json["is_audio_video"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "is_audio_video": isAudioVideo,
      };
}

class OpenapiSchema {
  OpenapiSchema({
    required this.info,
    required this.paths,
    required this.openapi,
    required this.components,
  });

  Info info;
  Paths paths;
  String openapi;
  Components components;

  factory OpenapiSchema.fromJson(Map<String, dynamic> json) => OpenapiSchema(
        info: Info.fromJson(json["info"]),
        paths: Paths.fromJson(json["paths"]),
        openapi: json["openapi"],
        components: Components.fromJson(json["components"]),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "paths": paths.toJson(),
        "openapi": openapi,
        "components": components.toJson(),
      };
}

class Components {
  Components({
    required this.schemas,
  });

  Schemas schemas;

  factory Components.fromJson(Map<String, dynamic> json) => Components(
        schemas: Schemas.fromJson(json["schemas"]),
      );

  Map<String, dynamic> toJson() => {
        "schemas": schemas.toJson(),
      };
}

class Schemas {
  Schemas({
    required this.input,
    required this.output,
    required this.status,
    required this.request,
    required this.version,
    required this.response,
    required this.validationError,
    required this.httpValidationError,
  });

  Input input;
  Output output;
  Request status;
  Request request;
  Request version;
  Response response;
  ValidationError validationError;
  HttpValidationError httpValidationError;

  factory Schemas.fromJson(Map<String, dynamic> json) => Schemas(
        input: Input.fromJson(json["Input"]),
        output: Output.fromJson(json["Output"]),
        status: Request.fromJson(json["Status"]),
        request: Request.fromJson(json["Request"]),
        version: Request.fromJson(json["version"]),
        response: Response.fromJson(json["Response"]),
        validationError: ValidationError.fromJson(json["ValidationError"]),
        httpValidationError:
            HttpValidationError.fromJson(json["HTTPValidationError"]),
      );

  Map<String, dynamic> toJson() => {
        "Input": input.toJson(),
        "Output": output.toJson(),
        "Status": status.toJson(),
        "Request": request.toJson(),
        "version": version.toJson(),
        "Response": response.toJson(),
        "ValidationError": validationError.toJson(),
        "HTTPValidationError": httpValidationError.toJson(),
      };
}

class HttpValidationError {
  HttpValidationError({
    required this.type,
    required this.title,
    required this.properties,
  });

  String type;
  String title;
  HttpValidationErrorProperties properties;

  factory HttpValidationError.fromJson(Map<String, dynamic> json) =>
      HttpValidationError(
        type: json["type"],
        title: json["title"],
        properties: HttpValidationErrorProperties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "properties": properties.toJson(),
      };
}

class HttpValidationErrorProperties {
  HttpValidationErrorProperties({
    required this.detail,
  });

  Detail detail;

  factory HttpValidationErrorProperties.fromJson(Map<String, dynamic> json) =>
      HttpValidationErrorProperties(
        detail: Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "detail": detail.toJson(),
      };
}

class Detail {
  Detail({
    required this.type,
    required this.items,
    required this.title,
  });

  String type;
  ValidationError items;
  String title;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        type: json["type"],
        items: ValidationError.fromJson(json["items"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "items": items.toJson(),
        "title": title,
      };
}

class ValidationError {
  ValidationError({
    required this.type,
    required this.title,
    required this.required,
    required this.properties,
  });

  String type;
  String title;
  List<String> required;
  ValidationErrorProperties properties;

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      ValidationError(
        type: json["type"],
        title: json["title"],
        required: List<String>.from(json["required"].map((x) => x)),
        properties: ValidationErrorProperties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "required": List<dynamic>.from(required.map((x) => x)),
        "properties": properties.toJson(),
      };
}

class ValidationErrorProperties {
  ValidationErrorProperties({
    required this.loc,
    required this.msg,
    required this.type,
  });

  Loc loc;
  Error msg;
  Error type;

  factory ValidationErrorProperties.fromJson(Map<String, dynamic> json) =>
      ValidationErrorProperties(
        loc: Loc.fromJson(json["loc"]),
        msg: Error.fromJson(json["msg"]),
        type: Error.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "loc": loc.toJson(),
        "msg": msg.toJson(),
        "type": type.toJson(),
      };
}

class Loc {
  Loc({
    required this.type,
    required this.items,
    required this.title,
  });

  String type;
  Items items;
  String title;

  factory Loc.fromJson(Map<String, dynamic> json) => Loc(
        type: json["type"],
        items: Items.fromJson(json["items"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "items": items.toJson(),
        "title": title,
      };
}

class Items {
  Items({
    required this.anyOf,
  });

  List<AnyOf> anyOf;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        anyOf: List<AnyOf>.from(json["anyOf"].map((x) => AnyOf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "anyOf": List<dynamic>.from(anyOf.map((x) => x.toJson())),
      };
}

class AnyOf {
  AnyOf({
    required this.type,
  });

  String type;

  factory AnyOf.fromJson(Map<String, dynamic> json) => AnyOf(
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
      };
}

class Error {
  Error({
    required this.type,
    required this.title,
  });

  Type type;
  String title;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        type: typeValues.map[json["type"]]!,
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "title": title,
      };
}

enum Type { STRING }

final typeValues = EnumValues({"string": Type.STRING});

class Input {
  Input({
    required this.type,
    required this.title,
    required this.required,
    required this.properties,
  });

  String type;
  String title;
  List<String> required;
  InputProperties properties;

  factory Input.fromJson(Map<String, dynamic> json) => Input(
        type: json["type"],
        title: json["title"],
        required: List<String>.from(json["required"].map((x) => x)),
        properties: InputProperties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "required": List<dynamic>.from(required.map((x) => x)),
        "properties": properties.toJson(),
      };
}

class InputProperties {
  InputProperties({
    required this.img,
    required this.tile,
    required this.scale,
    required this.version,
    required this.faceEnhance,
  });

  FaceEnhance img;
  FaceEnhance tile;
  FaceEnhance scale;
  PropertiesVersion version;
  FaceEnhance faceEnhance;

  factory InputProperties.fromJson(Map<String, dynamic> json) =>
      InputProperties(
        img: FaceEnhance.fromJson(json["img"]),
        tile: FaceEnhance.fromJson(json["tile"]),
        scale: FaceEnhance.fromJson(json["scale"]),
        version: PropertiesVersion.fromJson(json["version"]),
        faceEnhance: FaceEnhance.fromJson(json["face_enhance"]),
      );

  Map<String, dynamic> toJson() => {
        "img": img.toJson(),
        "tile": tile.toJson(),
        "scale": scale.toJson(),
        "version": version.toJson(),
        "face_enhance": faceEnhance.toJson(),
      };
}

class FaceEnhance {
  FaceEnhance({
    required this.type,
    required this.title,
    this.faceEnhanceDefault,
    required this.xOrder,
    required this.description,
    this.format,
  });

  String type;
  String title;
  dynamic faceEnhanceDefault;
  int xOrder;
  String description;
  String? format;

  factory FaceEnhance.fromJson(Map<String, dynamic> json) => FaceEnhance(
        type: json["type"],
        title: json["title"],
        faceEnhanceDefault: json["default"],
        xOrder: json["x-order"],
        description: json["description"],
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "default": faceEnhanceDefault,
        "x-order": xOrder,
        "description": description,
        "format": format,
      };
}

class PropertiesVersion {
  PropertiesVersion({
    required this.versionEnum,
    required this.type,
    required this.title,
    required this.description,
    required this.versionDefault,
    required this.xOrder,
  });

  List<String> versionEnum;
  Type type;
  String title;
  String description;
  String versionDefault;
  int xOrder;

  factory PropertiesVersion.fromJson(Map<String, dynamic> json) =>
      PropertiesVersion(
        versionEnum: List<String>.from(json["enum"].map((x) => x)),
        type: typeValues.map[json["type"]]!,
        title: json["title"],
        description: json["description"],
        versionDefault: json["default"],
        xOrder: json["x-order"],
      );

  Map<String, dynamic> toJson() => {
        "enum": List<dynamic>.from(versionEnum.map((x) => x)),
        "type": typeValues.reverse[type],
        "title": title,
        "description": description,
        "default": versionDefault,
        "x-order": xOrder,
      };
}

class Output {
  Output({
    required this.type,
    required this.title,
    required this.format,
  });

  Type type;
  String title;
  String format;

  factory Output.fromJson(Map<String, dynamic> json) => Output(
        type: typeValues.map[json["type"]]!,
        title: json["title"],
        format: json["format"],
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "title": title,
        "format": format,
      };
}

class Request {
  Request({
    required this.type,
    required this.title,
    this.properties,
    required this.description,
    this.requestEnum,
  });

  String type;
  String title;
  RequestProperties? properties;
  String description;
  List<String>? requestEnum;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        type: json["type"],
        title: json["title"],
        properties: json["properties"] == null
            ? null
            : RequestProperties.fromJson(json["properties"]),
        description: json["description"],
        requestEnum: json["enum"] == null
            ? []
            : List<String>.from(json["enum"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "properties": properties?.toJson(),
        "description": description,
        "enum": requestEnum == null
            ? []
            : List<dynamic>.from(requestEnum!.map((x) => x)),
      };
}

class RequestProperties {
  RequestProperties({
    required this.input,
    required this.outputFilePrefix,
  });

  Input input;
  Error outputFilePrefix;

  factory RequestProperties.fromJson(Map<String, dynamic> json) =>
      RequestProperties(
        input: Input.fromJson(json["input"]),
        outputFilePrefix: Error.fromJson(json["output_file_prefix"]),
      );

  Map<String, dynamic> toJson() => {
        "input": input.toJson(),
        "output_file_prefix": outputFilePrefix.toJson(),
      };
}

class Response {
  Response({
    required this.type,
    required this.title,
    required this.required,
    required this.properties,
    required this.description,
  });

  String type;
  String title;
  List<String> required;
  ResponseProperties properties;
  String description;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        type: json["type"],
        title: json["title"],
        required: List<String>.from(json["required"].map((x) => x)),
        properties: ResponseProperties.fromJson(json["properties"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "required": List<dynamic>.from(required.map((x) => x)),
        "properties": properties.toJson(),
        "description": description,
      };
}

class ResponseProperties {
  ResponseProperties({
    required this.error,
    required this.output,
    required this.status,
  });

  Error error;
  Output output;
  Request status;

  factory ResponseProperties.fromJson(Map<String, dynamic> json) =>
      ResponseProperties(
        error: Error.fromJson(json["error"]),
        output: Output.fromJson(json["output"]),
        status: Request.fromJson(json["status"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error.toJson(),
        "output": output.toJson(),
        "status": status.toJson(),
      };
}

class Info {
  Info({
    required this.title,
    required this.version,
  });

  String title;
  String version;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        title: json["title"],
        version: json["version"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "version": version,
      };
}

class Paths {
  Paths({
    required this.empty,
    required this.predictions,
  });

  Empty empty;
  Predictions predictions;

  factory Paths.fromJson(Map<String, dynamic> json) => Paths(
        empty: Empty.fromJson(json["/"]),
        predictions: Predictions.fromJson(json["/predictions"]),
      );

  Map<String, dynamic> toJson() => {
        "/": empty.toJson(),
        "/predictions": predictions.toJson(),
      };
}

class Empty {
  Empty({
    required this.purpleGet,
  });

  Get purpleGet;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
        purpleGet: Get.fromJson(json["get"]),
      );

  Map<String, dynamic> toJson() => {
        "get": purpleGet.toJson(),
      };
}

class Get {
  Get({
    required this.summary,
    required this.responses,
    required this.operationId,
  });

  String summary;
  Responses responses;
  String operationId;

  factory Get.fromJson(Map<String, dynamic> json) => Get(
        summary: json["summary"],
        responses: Responses.fromJson(json["responses"]),
        operationId: json["operationId"],
      );

  Map<String, dynamic> toJson() => {
        "summary": summary,
        "responses": responses.toJson(),
        "operationId": operationId,
      };
}

class Responses {
  Responses({
    required this.the200,
  });

  The200 the200;

  factory Responses.fromJson(Map<String, dynamic> json) => Responses(
        the200: The200.fromJson(json["200"]),
      );

  Map<String, dynamic> toJson() => {
        "200": the200.toJson(),
      };
}

class The200 {
  The200({
    required this.content,
    required this.description,
  });

  The200Content content;
  String description;

  factory The200.fromJson(Map<String, dynamic> json) => The200(
        content: The200Content.fromJson(json["content"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "content": content.toJson(),
        "description": description,
      };
}

class The200Content {
  The200Content({
    required this.applicationJson,
  });

  PurpleApplicationJson applicationJson;

  factory The200Content.fromJson(Map<String, dynamic> json) => The200Content(
        applicationJson:
            PurpleApplicationJson.fromJson(json["application/json"]),
      );

  Map<String, dynamic> toJson() => {
        "application/json": applicationJson.toJson(),
      };
}

class PurpleApplicationJson {
  PurpleApplicationJson({
    required this.schema,
  });

  PurpleSchema schema;

  factory PurpleApplicationJson.fromJson(Map<String, dynamic> json) =>
      PurpleApplicationJson(
        schema: PurpleSchema.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "schema": schema.toJson(),
      };
}

class PurpleSchema {
  PurpleSchema();

  factory PurpleSchema.fromJson(Map<String, dynamic> json) => PurpleSchema();

  Map<String, dynamic> toJson() => {};
}

class Predictions {
  Predictions({
    required this.post,
  });

  Post post;

  factory Predictions.fromJson(Map<String, dynamic> json) => Predictions(
        post: Post.fromJson(json["post"]),
      );

  Map<String, dynamic> toJson() => {
        "post": post.toJson(),
      };
}

class Post {
  Post({
    required this.summary,
    required this.responses,
    required this.description,
    required this.operationId,
    required this.requestBody,
  });

  String summary;
  Map<String, ResponseValue> responses;
  String description;
  String operationId;
  RequestBody requestBody;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        summary: json["summary"],
        responses: Map.from(json["responses"]).map((k, v) =>
            MapEntry<String, ResponseValue>(k, ResponseValue.fromJson(v))),
        description: json["description"],
        operationId: json["operationId"],
        requestBody: RequestBody.fromJson(json["requestBody"]),
      );

  Map<String, dynamic> toJson() => {
        "summary": summary,
        "responses": Map.from(responses)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "description": description,
        "operationId": operationId,
        "requestBody": requestBody.toJson(),
      };
}

class RequestBody {
  RequestBody({
    required this.content,
  });

  RequestBodyContent content;

  factory RequestBody.fromJson(Map<String, dynamic> json) => RequestBody(
        content: RequestBodyContent.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content.toJson(),
      };
}

class RequestBodyContent {
  RequestBodyContent({
    required this.applicationJson,
  });

  FluffyApplicationJson applicationJson;

  factory RequestBodyContent.fromJson(Map<String, dynamic> json) =>
      RequestBodyContent(
        applicationJson:
            FluffyApplicationJson.fromJson(json["application/json"]),
      );

  Map<String, dynamic> toJson() => {
        "application/json": applicationJson.toJson(),
      };
}

class FluffyApplicationJson {
  FluffyApplicationJson({
    required this.schema,
  });

  Request schema;

  factory FluffyApplicationJson.fromJson(Map<String, dynamic> json) =>
      FluffyApplicationJson(
        schema: Request.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "schema": schema.toJson(),
      };
}

class ResponseValue {
  ResponseValue({
    required this.content,
    required this.description,
  });

  ResponseContent content;
  String description;

  factory ResponseValue.fromJson(Map<String, dynamic> json) => ResponseValue(
        content: ResponseContent.fromJson(json["content"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "content": content.toJson(),
        "description": description,
      };
}

class ResponseContent {
  ResponseContent({
    required this.applicationJson,
  });

  TentacledApplicationJson applicationJson;

  factory ResponseContent.fromJson(Map<String, dynamic> json) =>
      ResponseContent(
        applicationJson:
            TentacledApplicationJson.fromJson(json["application/json"]),
      );

  Map<String, dynamic> toJson() => {
        "application/json": applicationJson.toJson(),
      };
}

class TentacledApplicationJson {
  TentacledApplicationJson({
    required this.schema,
  });

  FluffySchema schema;

  factory TentacledApplicationJson.fromJson(Map<String, dynamic> json) =>
      TentacledApplicationJson(
        schema: FluffySchema.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "schema": schema.toJson(),
      };
}

class FluffySchema {
  FluffySchema({
    required this.type,
    required this.title,
    this.required,
    required this.properties,
    this.description,
  });

  String type;
  String title;
  List<String>? required;
  PurpleProperties properties;
  String? description;

  factory FluffySchema.fromJson(Map<String, dynamic> json) => FluffySchema(
        type: json["type"],
        title: json["title"],
        required: json["required"] == null
            ? []
            : List<String>.from(json["required"]!.map((x) => x)),
        properties: PurpleProperties.fromJson(json["properties"]),
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "required":
            required == null ? [] : List<dynamic>.from(required!.map((x) => x)),
        "properties": properties.toJson(),
        "description": description,
      };
}

class PurpleProperties {
  PurpleProperties({
    this.error,
    this.output,
    this.status,
    this.detail,
  });

  Error? error;
  Output? output;
  Request? status;
  Detail? detail;

  factory PurpleProperties.fromJson(Map<String, dynamic> json) =>
      PurpleProperties(
        error: json["error"] == null ? null : Error.fromJson(json["error"]),
        output: json["output"] == null ? null : Output.fromJson(json["output"]),
        status:
            json["status"] == null ? null : Request.fromJson(json["status"]),
        detail: json["detail"] == null ? null : Detail.fromJson(json["detail"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error?.toJson(),
        "output": output?.toJson(),
        "status": status?.toJson(),
        "detail": detail?.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
