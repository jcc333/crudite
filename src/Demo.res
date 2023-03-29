

external recordAsJson: 'a => Js.Dict.t<Js.Json.t> = "%identity"

let recordAsJson = (record) =>
    record -> recordAsJson -> Js.Json.object_

type command = {
  verb: string,
  data: Js.Json.t
}

let cmd = {
  verb: "KEYPRESS",
  data: recordAsJson({"keycode": 41})
}

switch Js.Json.stringifyAny(cmd) {
  | Some(str) => Js.log(str)
  | None => Js.log("No dice babycakes!")
}
