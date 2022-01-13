abstract class ModelAdapter<Model, External> {
  Model toModel(External external);

  External fromModel(Model model);

  List<Model> toListModel(List<External> external) {
    return external.map((e) => this.toModel(e));
  }
}