/*
    Custom Header - JSGI middleware module to add a custom date header
 */
exports.CustomHeader = function(app) {
    return function(request) {
        var response = app(request)
        response.headers ||= {}
        response.headers["Custom-Header"] = Date().toString()
        return response
    }
}
