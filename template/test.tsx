import React from "react";

interface AppState {
    count: number;
}

const fun = (): void => {
    console.log("Hello, world");
}

fun();

export default class App extends React.Component<{}, AppState> {
    constructor(props: {}) {
        super(props);
        this.state = {
            count: 0,
        };
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick() {
        this.setState((prevState) => {
            return {
                count: prevState.count + 1,
            };
        });
    }

    render() {
        return (
            <div>
                <h1 class="">{this.state.count}</h1>
                <button onClick={this.handleClick}>Change!</button>
            </div>
        );
    }
}
