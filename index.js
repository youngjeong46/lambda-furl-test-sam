var uuid = require('uuid');

exports.handler = async (event) => {
    const id = uuid.v4();
    const dateNow = Date.now();
    const time = new Date(dateNow).toString();
    // TODO implement
    const response = {
        statusCode: 200,
        body: JSON.stringify(`This is auto-generated message with id: ${id}. Current time: ${time}.`),
    };
    return response;
};
