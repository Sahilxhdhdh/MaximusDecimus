'use strict';

class DemoContract {

    async InitLedger(ctx) {
        console.log("Ledger Initialized");
    }

    async SetMessage(ctx, id, message) {

        const data = {
            id,
            message
        };

        await ctx.stub.putState(
            id,
            Buffer.from(JSON.stringify(data))
        );
    }

    async GetMessage(ctx, id) {

        const data = await ctx.stub.getState(id);

        return data.toString();
    }
}

module.exports = DemoContract;